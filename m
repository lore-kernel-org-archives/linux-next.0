From: Dave Chinner <david@fromorbit.com>
Subject: Re: randconfig build error with next-20150603, in fs/xfs/xfs_inode.c
Date: Thu, 4 Jun 2015 13:01:03 +1000
Message-ID: <20150604030103.GJ9143@dastard>
References: <CA+r1Zhh5oW+z_DwszUehhF+ke41soBzHPcC7QCYH9yV+0A=upA@mail.gmail.com>
	<CAP=VYLppm7teN4LMpOAgXFunmDjnYLFV_mdbZTPaPWMqTwQPtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xfs-bounces@oss.sgi.com>
Content-Disposition: inline
In-Reply-To: <CAP=VYLppm7teN4LMpOAgXFunmDjnYLFV_mdbZTPaPWMqTwQPtg@mail.gmail.com>
List-Unsubscribe: <http://oss.sgi.com/mailman/options/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=unsubscribe>
List-Archive: <http://oss.sgi.com/pipermail/xfs>
List-Post: <mailto:xfs@oss.sgi.com>
List-Help: <mailto:xfs-request@oss.sgi.com?subject=help>
List-Subscribe: <http://oss.sgi.com/mailman/listinfo/xfs>,
	<mailto:xfs-request@oss.sgi.com?subject=subscribe>
Errors-To: xfs-bounces@oss.sgi.com
Sender: xfs-bounces@oss.sgi.com
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, xfs@oss.sgi.com, linux-next <linux-next@vger.kernel.org>, Jim Davis <jim.epost@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 03, 2015 at 10:36:54PM -0400, Paul Gortmaker wrote:
> On Wed, Jun 3, 2015 at 12:31 PM, Jim Davis <jim.epost@gmail.com> wrote:
> > Building with the attached random configuration file,
> >
> > fs/built-in.o: In function `xfs_ifree_cluster':
> > /home/jim/linux/fs/xfs/xfs_inode.c:2268: undefined reference to `__umoddi3'
> 
> I don't think this is specific to a particular randconfig.
> 
> On ARM allmodconfig, I saw:
> 
> ERROR: "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined!
> 
> On powerpc with an older gcc-4.5 toolchain, I saw:
> 
> /bin/sh: line 1: 23453 Segmentation fault      powerpc-linux-ld -EB -m
> elf64ppc -r -T /home/paul/git/linux-head/scripts/module-common.lds
> arch/powerpc/lib/crtsavres.o --build-id -o fs/xfs/xfs.ko fs/xfs/xfs.o
> fs/xfs/xfs.mod.o
> make[2]: *** [fs/xfs/xfs.ko] Error 139
> 
> I have not investigated further than that.

A fix is already pending. Probably be in tomorrow's linux-next
build.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

_______________________________________________
xfs mailing list
xfs@oss.sgi.com
http://oss.sgi.com/mailman/listinfo/xfs
