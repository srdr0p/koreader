param(
    [Parameter(Mandatory=$true)]
    [string]$SshTarget,  # Format: user@hostname

    [string]$LocalFile = "frontend/apps/reader/modules/readerpaging.lua",

    [string]$RemotePath = "/mnt/us/koreader/frontend/apps/reader/modules/"
)

# Ensure scp is available (assuming it's installed, e.g., via OpenSSH or PuTTY)
# For OpenSSH: scp -i $KeyFile -o StrictHostKeyChecking=no $LocalFile "${UserName}@${HostName}:${RemotePath}"
# For PuTTY: pscp -i $KeyFile -scp $LocalFile "${UserName}@${HostName}:${RemotePath}"

# Using scp (OpenSSH)
if ($KeyFile) {
    scp -P 2222 -i $KeyFile -o StrictHostKeyChecking=no $LocalFile "${SshTarget}:${RemotePath}"
} else {
    scp -P 2222 -o StrictHostKeyChecking=no $LocalFile "${SshTarget}:${RemotePath}"
}