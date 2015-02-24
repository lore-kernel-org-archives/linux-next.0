From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 24 (build failure due to 'GFS2:
 Allocate reservation during splice_write')
Date: Mon, 23 Feb 2015 21:19:50 -0800
Message-ID: <20150224051950.GA20733@roeck-us.net>
References: <20150224140257.729c3958@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150224140257.729c3958@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 24, 2015 at 02:02:57PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150223:
> 
> The hid tree gained a conflict against Linus' tree.
> 
> The drm-misc tree gained a build failure for which I applied a merge
> fix patch.
> 
> Non-merge commits (relative to Linus' tree): 1108
>  718 files changed, 18557 insertions(+), 17357 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Building powerpc:ppc6xx_defconfig ... failed
--------------
Error log:
fs/gfs2/file.c:1126:18: error: 'gfs2_file_splice_write' undeclared here (not in a function)
  .splice_write = gfs2_file_splice_write,
                    ^
		    make[2]: *** [fs/gfs2/file.o] Error 1

---
Bisect log:

# bad: [549c45cea13c1b1d4557dec2e5e3f256615682f6] Add linux-next specific files for 20150224
# good: [c517d838eb7d07bbe9507871fab3931deccff539] Linux 4.0-rc1
git bisect start 'HEAD' 'v4.0-rc1'
# bad: [bb37267e803b5d88eca99db1f501cb0410de60ff] Merge remote-tracking branch 'integrity/next'
git bisect bad bb37267e803b5d88eca99db1f501cb0410de60ff
# bad: [92ad07ab5fe41297c43ed12f906bf2a371fb02c2] Merge remote-tracking branch 'libata/for-next'
git bisect bad 92ad07ab5fe41297c43ed12f906bf2a371fb02c2
# good: [b50209f57aa2f0efb01ce23e8a95e201a3f0f083] Merge remote-tracking branch 'sunxi/sunxi/for-next'
git bisect good b50209f57aa2f0efb01ce23e8a95e201a3f0f083
# bad: [9a2289ef9475e6f5477eeffc6f9ea4611a8f4d7e] Merge remote-tracking branch 'hwmon-staging/hwmon-next'
git bisect bad 9a2289ef9475e6f5477eeffc6f9ea4611a8f4d7e
# bad: [d5e48de5d4539325c8617e97ac925d226558e366] Merge remote-tracking branch 'gfs2/for-next'
git bisect bad d5e48de5d4539325c8617e97ac925d226558e366
# good: [37264bf1c7c1196e1d969233ef56aaba0f019921] Merge remote-tracking branch 's390/features'
git bisect good 37264bf1c7c1196e1d969233ef56aaba0f019921
# good: [ad17b8ddd9b34a5138898da01831e316203bf6cc] Merge remote-tracking branch 'ceph/master'
git bisect good ad17b8ddd9b34a5138898da01831e316203bf6cc
# good: [7cff319abaa1af7d85262bf05ee3a97dc4e91edc] Merge remote-tracking branch 'cifs/for-next'
git bisect good 7cff319abaa1af7d85262bf05ee3a97dc4e91edc
# good: [1521e10543f3f276d33e53988e8691669d0ae11f] Merge remote-tracking branch 'fscache/fscache'
git bisect good 1521e10543f3f276d33e53988e8691669d0ae11f
# good: [9717c008020ab10ed4fb5261d9ceea7fd366e3b3] GFS2: gfs2_set_acl(): Cache "no acl" as well
git bisect good 9717c008020ab10ed4fb5261d9ceea7fd366e3b3
# bad: [76514aeef65e32cb43a755052b02d3b2fb417735] GFS2: Allocate reservation during splice_write
git bisect bad 76514aeef65e32cb43a755052b02d3b2fb417735
# first bad commit: [76514aeef65e32cb43a755052b02d3b2fb417735] GFS2: Allocate reservation during splice_write

Not surprising; gfs2_file_splice_write is declared within an #ifdef
but referenced from outside it.

Guenter
