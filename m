From: Stephan Mueller <smueller@chronox.de>
Subject: Re: linux-next: Tree for Aug 26 (drbg)
Date: Tue, 26 Aug 2014 22:19:11 +0200
Message-ID: <2143681.nIInT2cPxl@myon.chronox.de>
References: <20140826173452.7cc5445c@canb.auug.org.au> <53FCDA03.3050504@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <53FCDA03.3050504@infradead.org>
Sender: linux-crypto-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Am Dienstag, 26. August 2014, 12:03:31 schrieb Randy Dunlap:

Hi Randy,

> On 08/26/14 00:34, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20140825:
> > 
> > The net tree gained a build failure for which I reverted a commit.
> > 
> > The mfd tree still had its build failure so I used the version from
> > next-20140822.
> 
> on i386:
> 
> ../include/crypto/drbg.h:157:2: warning: left shift count >= width of type
> [enabled by default] ../include/crypto/drbg.h:163:2: warning: left shift
> count >= width of type [enabled by default]
> 
> I guess that someone has already seen this but I haven't noticed any reports
> of it.

Thank you for reporting the issue. The patch and fix is provided with [1]. Did 
you test with this patch?

[1] 
https://git.kernel.org/cgit/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=b9347aff91ce4789619168539f08202d8d6a1177

-- 
Ciao
Stephan
