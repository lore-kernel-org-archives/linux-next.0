From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 11 (net/xfrm/xfrm_output.c)
Date: Thu, 11 Apr 2019 08:20:02 -0700
Message-ID: <f0568f8c-cc47-257d-c36e-0ca7505a33d0@infradead.org>
References: <20190411164912.5168be0d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411164912.5168be0d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 4/10/19 11:49 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190410:
> 
> The orangefs tree gained a build failure so I used the version from
> next-20190410.
> 
> The drm tree still had its build failure for which I disabled a driver.
> 
> The drm-misc tree still had its build failure for which I marked a driver
> as BROKEN.
> 
> The apparmor tree gained a conflict against Linus' tree.
> 
> The scsi tree lost its build failure.
> 
> The akpm tree gained a conflict against the vfs tree.
> 
> Non-merge commits (relative to Linus' tree): 6028
>  5900 files changed, 189559 insertions(+), 92953 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig. And finally, a simple boot test of the powerpc
> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 298 trees (counting Linus' and 69 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

on i386 or x86_64, when CONFIG_INET is not set/enabled:

../net/xfrm/xfrm_output.c: In function ‘xfrm4_tunnel_encap_add’:
../net/xfrm/xfrm_output.c:234:2: error: implicit declaration of function ‘ip_select_ident’ [-Werror=implicit-function-declaration]
  ip_select_ident(dev_net(dst->dev), skb, NULL);
  ^


-- 
~Randy
