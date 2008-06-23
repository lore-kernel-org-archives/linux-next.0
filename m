From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next build poblems
Date: Mon, 23 Jun 2008 18:10:23 +0100
Message-ID: <20080623171023.GA16238@flint.arm.linux.org.uk>
References: <20080624022232.5c81519c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:54873 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755344AbYFWRLA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Jun 2008 13:11:00 -0400
Content-Disposition: inline
In-Reply-To: <20080624022232.5c81519c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, Haavard Skinnemoen <hskinnemoen@atmel.com>, Paul Mundt <lethal@linux-sh.org>, linux-next@vger.kernel.org

On Tue, Jun 24, 2008 at 02:22:32AM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> I haven't had a good look, but something has gone badly wrong with the
> arm, avr32 and sh builds of linux-next today.  Have a look at
> http://kisskb.ellerman.id.au/linux-next.

Looks like samr's to blame.

Before:
/path/to/build/directory/include:
lrwxrwxrwx   1 rmk rmk    7 Nov 27  2007 asm -> asm-arm
drwxrwxr-x   2 rmk rmk 4096 Jun  2 19:40 asm-arm
drwxr-xr-x 194 rmk rmk 8192 Jun  2 19:43 config
drwxrwxr-x   2 rmk rmk 4096 Jun  2 19:43 linux

After:
/path/to/build/directory/include:
drwxrwxr-x   2 rmk rmk 4096 Jun 23 17:59 asm-arm
drwxrwxr-x 107 rmk rmk 4096 Jun 23 18:00 config
drwxrwxr-x   2 rmk rmk 4096 Jun 23 18:00 linux

and inside /path/to/build/directory/include/asm-arm:
lrwxrwxrwx 1 rmk rmk     59 Jun 23 17:59 arch -> /home/rmk/git/linux-2.6-test/include/asm-arm/arch-versatile
-rw-rw-r-- 1 rmk rmk 603835 Jun 23 17:59 mach-types.h

Note the symlink inside include/asm-arm, and the lack of asm -> asm-arm
symlink.  This means that <asm/arch/foo.h> won't be found.

Running make with V=1 results in (reformatted for readability):

set -e; asmlink=`readlink include/asm | cut -d '-' -f 2`; 
if [ -L include/asm ]; then
   if [ "$asmlink" != "arm" ]; then
      echo "ERROR: the symlink include/asm points to asm-$asmlink but asm-arm was expected";
      echo "       set ARCH or save .config and run 'make mrproper' to fix it";
      exit 1;
   fi;
fi
if [ -L include/asm ]; then
   rm include/asm;
fi

Notice that it removes the include/asm symlink and never restores it.

Looks to me like the cause is 2c4cd2923a69b89526adc4869626d139f24ea3a7.

Sam?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
