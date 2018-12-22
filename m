From: Chandan Rajendra <chandan@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Dec 21
Date: Sat, 22 Dec 2018 12:13:35 +0530
Message-ID: <2778925.B2WVoZk5xr@localhost.localdomain>
References: <20181221193244.3a6ed685@canb.auug.org.au> <20181221162149.GA32500@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221162149.GA32500@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Fernandes <joel@joelfernandes.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, Sinan Kaya <okaya@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Theodore Ts'o <tytso@mit.edu>, Florian Westphal <fw@strlen.de>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wen He <wen.he_1@nxp.com>, Peng Ma <peng.ma@nxp.com>, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: linux-next.vger.kernel.org

On Friday, December 21, 2018 9:51:49 PM IST Guenter Roeck wrote:
> On Fri, Dec 21, 2018 at 07:32:44PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next release until Jan 2.  Have a good break.
> > 
> > Changes since 20181220:
> > 
> > New tree: gpio-brgl
> > 
> > The pm tree gained a conflict against the kbuild tree.
> > 
> > The bpf-next tree gained a conflict against Linus' tree.
> > 
> > The kvm tree gained a conflict against the powerpc tree.
> > 
> > The akpm tree lost a patch that turned up elsewhere.
> > 
> > Non-merge commits (relative to Linus' tree): 10464
> >  10564 files changed, 495226 insertions(+), 271806 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> 

[..]

> [3]:
> 
> # bad: [340ae71f9dd421227a58c14a909b63033745dca4] Add linux-next specific files for 20181221
> # good: [7566ec393f4161572ba6f11ad5171fd5d59b0fbd] Linux 4.20-rc7
> git bisect start 'HEAD' 'v4.20-rc7'
> # bad: [9f3de88514b2b5666214f0be3bc98d4e7136a7f1] Merge remote-tracking branch 'mtd/mtd/next'
> git bisect bad 9f3de88514b2b5666214f0be3bc98d4e7136a7f1
> # bad: [f915ece8cdbafa705badb5417e8c70ff83a63172] Merge remote-tracking branch 'hid/for-next'
> git bisect bad f915ece8cdbafa705badb5417e8c70ff83a63172
> # good: [bf1c4d50b9fa6e80ad13293b4acace16dfddad0b] Merge remote-tracking branch 'arm-soc/for-next'
> git bisect good bf1c4d50b9fa6e80ad13293b4acace16dfddad0b
> # good: [4419ffc60fb0eb3c5c61ac4d41d2b45f5fa001ed] Merge remote-tracking branch 's390/features'
> git bisect good 4419ffc60fb0eb3c5c61ac4d41d2b45f5fa001ed
> # bad: [26b69eb30a87a11edf53924ea0051f28070f5223] Merge remote-tracking branch 'jfs/jfs-next'
> git bisect bad 26b69eb30a87a11edf53924ea0051f28070f5223
> # good: [0078a3f8bf05002d636a6d4816c2635096803c24] Merge branch 'for-next-current-v4.19-20181219' into for-next-20181219
> git bisect good 0078a3f8bf05002d636a6d4816c2635096803c24
> # good: [fb468109d7cffc217b8cbc73909d2236b308779e] Merge remote-tracking branch 'xtensa/xtensa-for-next'
> git bisect good fb468109d7cffc217b8cbc73909d2236b308779e
> # bad: [46aa53167cf1b522a2144cc3f5543a2b9c6fdf2b] Merge remote-tracking branch 'ext3/for_next'
> git bisect bad 46aa53167cf1b522a2144cc3f5543a2b9c6fdf2b
> # bad: [3a370c761f2bd1cf771e3a2d691c9ee2e71c109f] Merge remote-tracking branch 'befs/for-next'
> git bisect bad 3a370c761f2bd1cf771e3a2d691c9ee2e71c109f
> # good: [bff49d3e9affae6f9e38a9103a4166ade2c310dd] ext4: add basic fs-verity support
> git bisect good bff49d3e9affae6f9e38a9103a4166ade2c310dd
> # bad: [c942d68713c322c27ecb8287af077571b4ab0c08] ext4: use IS_VERITY() to check inode's fsverity status
> git bisect bad c942d68713c322c27ecb8287af077571b4ab0c08
> # good: [dc82005ead5de0e5bb764c0c1c50a19891b6de15] ext4: use IS_ENCRYPTED() to check encryption status
> git bisect good dc82005ead5de0e5bb764c0c1c50a19891b6de15
> # bad: [f3fd6cd74fedf99b6060f75df00943fda13b65f2] fscrypt: remove filesystem specific build config option
> git bisect bad f3fd6cd74fedf99b6060f75df00943fda13b65f2
> # good: [1dcfeb539c09237c98b99685fb9cd156241db13f] f2fs: use IS_ENCRYPTED() to check encryption status
> git bisect good 1dcfeb539c09237c98b99685fb9cd156241db13f
> # first bad commit: [f3fd6cd74fedf99b6060f75df00943fda13b65f2] fscrypt:
> # remove filesystem specific build config option

The patch at https://patchwork.kernel.org/patch/10725883/ fixes this problem
by removing "select BLOCK if FS_ENCRYPTION" from fs/ubifs/Kconfig.

-- 
chandan
