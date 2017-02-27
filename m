From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Mon, 27 Feb 2017 11:27:14 +1100
Message-ID: <20170227112714.23e5ddf4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

samples/statx/test-statx.c:37:34: warning: 'struct statx' declared inside parameter list will not be visible outside of this definition or declaration
        unsigned int mask, struct statx *buffer)
                                  ^~~~~
samples/statx/test-statx.c: In function 'statx':
samples/statx/test-statx.c:39:17: error: '__NR_statx' undeclared (first use in this function)
  return syscall(__NR_statx, dfd, filename, flags, mask, buffer);
                 ^~~~~~~~~~
samples/statx/test-statx.c:39:17: note: each undeclared identifier is reported only once for each function it appears in
samples/statx/test-statx.c: At top level:
samples/statx/test-statx.c:42:50: warning: 'struct statx_timestamp' declared inside parameter list will not be visible outside of this definition or declaration
 static void print_time(const char *field, struct statx_timestamp *ts)
                                                  ^~~~~~~~~~~~~~~
samples/statx/test-statx.c: In function 'print_time':
samples/statx/test-statx.c:49:10: error: dereferencing pointer to incomplete type 'struct statx_timestamp'
  tim = ts->tv_sec;
          ^~
samples/statx/test-statx.c: At top level:
samples/statx/test-statx.c:71:31: warning: 'struct statx' declared inside parameter list will not be visible outside of this definition or declaration
 static void dump_statx(struct statx *stx)
                               ^~~~~
samples/statx/test-statx.c: In function 'dump_statx':
samples/statx/test-statx.c:75:28: error: dereferencing pointer to incomplete type 'struct statx'
  printf("results=%x\n", stx->stx_mask);
                            ^~
samples/statx/test-statx.c:78:22: error: 'STATX_SIZE' undeclared (first use in this function)
  if (stx->stx_mask & STATX_SIZE)
                      ^~~~~~~~~~
samples/statx/test-statx.c:80:22: error: 'STATX_BLOCKS' undeclared (first use in this function)
  if (stx->stx_mask & STATX_BLOCKS)
                      ^~~~~~~~~~~~
samples/statx/test-statx.c:83:22: error: 'STATX_TYPE' undeclared (first use in this function)
  if (stx->stx_mask & STATX_TYPE) {
                      ^~~~~~~~~~
samples/statx/test-statx.c:102:22: error: 'STATX_INO' undeclared (first use in this function)
  if (stx->stx_mask & STATX_INO)
                      ^~~~~~~~~
samples/statx/test-statx.c:104:22: error: 'STATX_NLINK' undeclared (first use in this function)
  if (stx->stx_mask & STATX_NLINK)
                      ^~~~~~~~~~~
samples/statx/test-statx.c:117:22: error: 'STATX_MODE' undeclared (first use in this function)
  if (stx->stx_mask & STATX_MODE)
                      ^~~~~~~~~~
samples/statx/test-statx.c:130:22: error: 'STATX_UID' undeclared (first use in this function)
  if (stx->stx_mask & STATX_UID)
                      ^~~~~~~~~
samples/statx/test-statx.c:132:22: error: 'STATX_GID' undeclared (first use in this function)
  if (stx->stx_mask & STATX_GID)
                      ^~~~~~~~~
samples/statx/test-statx.c:135:22: error: 'STATX_ATIME' undeclared (first use in this function)
  if (stx->stx_mask & STATX_ATIME)
                      ^~~~~~~~~~~
samples/statx/test-statx.c:137:22: error: 'STATX_MTIME' undeclared (first use in this function)
  if (stx->stx_mask & STATX_MTIME)
                      ^~~~~~~~~~~
samples/statx/test-statx.c:139:22: error: 'STATX_CTIME' undeclared (first use in this function)
  if (stx->stx_mask & STATX_CTIME)
                      ^~~~~~~~~~~
samples/statx/test-statx.c:141:22: error: 'STATX_BTIME' undeclared (first use in this function)
  if (stx->stx_mask & STATX_BTIME)
                      ^~~~~~~~~~~
samples/statx/test-statx.c: In function 'main':
samples/statx/test-statx.c:207:15: error: storage size of 'stx' isn't known
  struct statx stx;
               ^~~
samples/statx/test-statx.c:210:22: error: 'STATX_ALL' undeclared (first use in this function)
  unsigned int mask = STATX_ALL;
                      ^~~~~~~~~
samples/statx/test-statx.c:228:13: error: 'STATX_BASIC_STATS' undeclared (first use in this function)
    mask &= ~STATX_BASIC_STATS;
             ^~~~~~~~~~~~~~~~~
samples/statx/test-statx.c:207:15: warning: unused variable 'stx' [-Wunused-variable]
  struct statx stx;
               ^~~

Caused by commit

  caffc373c573 ("statx: Add a system call to make enhanced file info available")

It probably would have been nice to see this in -next a bit earlier.

I have added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 27 Feb 2017 11:21:47 +1100
Subject: [PATCH] statx: disable the sample code for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 samples/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/samples/Kconfig b/samples/Kconfig
index e1fc9a6a96fa..9cb63188d3ef 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -114,6 +114,7 @@ config SAMPLE_VFIO_MDEV_MTTY
 
 config SAMPLE_STATX
 	bool "Build example extended-stat using code"
+	depends on BROKEN
 	help
 	  Build example userspace program to use the new extended-stat syscall.
 
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
