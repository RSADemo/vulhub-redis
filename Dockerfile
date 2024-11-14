FROM vulhub/redis:5.0.7

# Add dummy layers to increase image size
RUN dd if=/dev/urandom of=/tmp/dummy1 bs=1M count=100 && \
    rm /tmp/dummy1
    
RUN dd if=/dev/urandom of=/tmp/dummy2 bs=1M count=150 && \
    rm /tmp/dummy2
    
RUN dd if=/dev/urandom of=/tmp/dummy3 bs=1M count=200 && \
    rm /tmp/dummy3

# Create some empty directories to add layers
RUN mkdir -p /var/dummy/dir1 && \
    mkdir -p /var/dummy/dir2 && \
    mkdir -p /var/dummy/dir3

# Add some text files with random content
RUN for i in {1..10}; do \
        echo "Dummy content $i" > "/var/dummy/file$i.txt"; \
    done
