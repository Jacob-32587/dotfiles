 export USER="j32587"
 export privkey="signing_key.pem"
 export pubkey="signing_key.x509"

# Generate signing key for kernel modules
openssl req -new -x509 -newkey rsa:4096 \
            -keyout $privkey \
            -outform DER -out $pubkey -days 36500 \
            -subj "/CN=$USER/" \
            -addext "extendedKeyUsage=codeSigning" \
            -nodes
# Generate der file
openssl x509 -in signing_key.x509 -outform der -out signing_key.der
# import the signing key
mokutil --import signing_key.der

# Follow this to learn more: https://en.opensuse.org/openSUSE:UEFI#Signing_kernel_module_for_verification
