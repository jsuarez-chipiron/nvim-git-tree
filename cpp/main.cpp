#include <iostream>
#include <cstdio>
#include <memory>
#include <array>
#include <vector>
#include <string_view>

std::vector<std::string> exec(const char* cmd) {
    std::array<char, 512> buffer {};
    std::unique_ptr<FILE, decltype(&pclose)> pipe(popen(cmd, "r"), pclose); // NOLINT
    std::vector<std::string> result;

    if (!pipe) 
    {
        throw std::runtime_error("popen() failed!");
    }

    while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) 
    {
        result.emplace_back(buffer.data());
    }

    return result;
}

std::string parse_line(std::string_view line)
{
    auto pos = line.find(">#####");
    if ( pos == std::string_view::npos ) { return std::string(line); }

    std::string_view temp = line.substr(0, pos+1);
    if ( line.substr(pos).find(' ') != std::string_view::npos )
    {
        auto idx = temp.find('-')+2;
        std::string pre = std::string(temp.substr(0, idx));
        return pre + "[MERGE] " + std::string(temp.substr(idx)) + '\n';
    }

    return std::string(temp) + '\n'; 
}

int main(int argc, char ** argv)
{
    std::string cmd("git log --graph --pretty=format:'%h -%d %s (%cD) <%an>#####%p' --abbrev-commit ");
    for (size_t i=1; i<argc; ++i) { cmd += std::string(argv[i]) + " "; } // NOLINT

    auto lines = exec(cmd.c_str());
    for (const auto& line: lines)
    {
        std::cout << parse_line(line);
    }

    return 0;
}
