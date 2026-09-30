local socket = require("socket")

function fetch()
    print("OS:     LuOS")
    print("KRNL:   LuOS-0.1")
    print("SH:     LuaSHell (LSH)")
end

function startup()
    os.execute("clear")
    print('Welcome to LuOS!\n')
    socket.sleep(0.75)
    io.write('Starting drivers...')
    io.flush()
    socket.sleep(1.25)
    io.write('\rStarting drivers... (GOOD)\n')
    io.flush()
    socket.sleep(0.238)
    io.write('Starting kernel...')
    io.flush()
    socket.sleep(3.42)
    io.write('\rStarting kernel... (GOOD)\n')
    socket.sleep(1.96)
    
    io.write('Starting network daemon...')
    io.flush()
    socket.sleep(1.14)
    io.write('\rStarting network daemon... (GOOD)\n')
    print('Testing connectivity')
    
    local handle = io.popen("ping -c 3 -w 3 8.8.8.8 2>&1")
    local result = handle:read("*a")
    local success, exit_type, exit_code = handle:close()
    if success then
        print("Internet connection is working.")
        internet = true
    else
        print("Internet connection failed.")
        internet = false
    end
    
    io.write('Starting lsh...')
    io.flush()
    socket.sleep(1.243)
    io.write('\rStarting lsh... (GOOD)\n')
    socket.sleep(1)
end

function lsh()
    os.execute("clear")
    print("type 'help' for a list of commands.\n")
    if internet == false then
        print("\nno internet connection!")
    else
        print("internet connection online!")
    end
    print("\ntype 'shutdown' to exit.")
    while true do
        io.write("\nlsh $> ")
        local input = io.read()
        if input == "help" then
            print("commands\n-----------\nhelp\nversion\nfetch\nflood\necho\nshutdown")
        elseif input == "version" then
            print("LuaSHell (LSH) Version 0.1 (LSH 0.1)")
        elseif input == "flood" then
            for i = 1, 1000 do
                print("FLOOOOOOOOOOOOOOOOOOOOOOOOOOODDDDDDDD!!!")
                socket.sleep(0.005)
            end    
        elseif input == "fetch" then
            print()
            fetch()
        elseif input:sub(1, 5) == "echo " then
            print(input:sub(6))
        elseif input == "echo" then
            print("please enter what you wanna type!")
        elseif input == "shutdown" then
            print("powering off...")
            socket.sleep(1)
            os.execute("clear")
            os.exit()
        else
            print("lsh error: command not found")
        end
    end
end

startup()
lsh()
