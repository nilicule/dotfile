plex () {
    local original_name="$1"
    
    # 1. Replace square brackets with nothing (keeping the content inside)
    # 2. Replace parentheses with nothing
    # 3. Trim leading/trailing whitespace
    # 4. Replace spaces with periods
    # 5. Remove consecutive periods
    local safe_name=$(echo "$original_name" | 
        sed 's/\[//g; s/\]//g' | 
        sed 's/(//g; s/)//g' | 
        sed 's/^[ \t]*//;s/[ \t]*$//' | 
        sed 's/ /./g' | 
        sed 's/\.\.*/./g')
    
    echo "Copying $safe_name to server ($original_name)"
    
    # Create a temporary directory for the renamed file
    local temp_dir=$(mktemp -d)
    cp -r "$original_name" "$temp_dir/$safe_name"
    
    # Upload the renamed file
    scp -r "$temp_dir/$safe_name" flow@rc6.org:~/.plexupload/new/
    
    # Process on the server
    ssh flow@rc6.org "cd ~/.plexupload/new && ~/bin/rtorrent-scp $safe_name"
    
    # Clean up
    rm -rf "$temp_dir"
}
