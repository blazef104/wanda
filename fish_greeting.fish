

function fish_greeting -d "Greeting message on shell session start up"

    echo ""
    echo -en "        |         " (welcome_message) "\n"
    echo -en "       / \        \n"
    echo -en "      / _ \       " (show_date_info) "\n"
    echo -en "     |  X  |      \n"
    echo -en "     |__X__|      Space vessel computer:\n"
    echo -en "     |     |      " (show_os_info) "\n"
    echo -en "   ,'|  |  |`.    " (show_cpu_info) "\n"
    echo -en "  /  |  |  |  \   " (show_mem_info) "\n"
    echo -en "  |,-'--|--'-.|   " (show_net_info) "\n"
    echo ""
    set_color grey
    echo "Have a nice trip"
    set_color normal
end


function welcome_message -d "Say welcome to user"

    echo -en "Welcome back captain "
    set_color FFF  # white
    echo -en (whoami) "!"
    set_color normal
end


function show_date_info -d "Prints information about date"

    set --local up_time (uptime | cut -d " " -f4,5 | tr -d ",")

    echo -en "Today is "
    set_color cyan
    echo -en (date +%d-%m-%Y)
    set_color normal
end


function show_os_info -d "Prints operating system info"

    set_color yellow
    echo -en "\tOS: "
    set_color 0F0  # green
    echo -en (uname -r)
    set_color normal
end


function show_cpu_info -d "Prints iformation about cpu"

    set --local cpu_info ""

    set --local procs_n (grep -c "^processor" /proc/cpuinfo)
    set --local cpu_type (grep "model name" /proc/cpuinfo | head -1 | cut -d ":" -f2)
    set cpu_info "$cpu_type, $procs_n cores"

    set_color yellow
    echo -en "\tCPU: "
    set_color 0F0  # green
    echo -en $cpu_info
    set_color normal
end


function show_mem_info -d "Prints memory information"

    set --local total_memory ""
    set --local avail (free -h | grep "Mem" | cut -d ":" -f2,2 | awk '{print $1}')
    set --local free (free -h | grep "Mem" | cut -d ":" -f2,2 | awk '{print $3}')
    set total_memory "$avail total, $free free."

    set_color yellow
    echo -en "\tMemory: "
    set_color 0F0  # green
    echo -en $total_memory
    set_color normal
end


function show_net_info -d "Prints information about network"

    set --local net ""

    set --local ip (ip addr show | grep -v "127.0.0.1" | grep "inet" | head -1 |awk '{print $2}')
    set --local iface (ip addr show | grep -v "127.0.0.1" | grep "inet" | head -1 |awk '{print $7}')
    set net "Ip address $ip, interface $iface"

    set_color yellow
    echo -en "\tNet: "
    set_color 0F0  # green
    echo -en $net
    set_color normal
end
