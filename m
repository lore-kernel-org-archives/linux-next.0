From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: linux-next: merge of the arm tree into the at91 tree
Date: Fri, 27 Jan 2012 10:56:26 +0100
Message-ID: <4F2274CA.7020809@atmel.com>
References: <20120127093619.f2c90c6aa8b542134a157956@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120127093619.f2c90c6aa8b542134a157956@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King <rmk@arm.linux.org.uk>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
List-Id: linux-next.vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/26/2012 11:36 PM, Stephen Rothwell :
> Hi all,
> 
> I noticed that the for-next branch of the arm tree has been merged 
> into the at91 tree.  My understanding (and Russell, please correct 
> me if I am wrong) is that the for-next branch is *not* stable and 
> may be rebased. This will cause all sorts of problems in
> linux-next in the future (and also when Russell or the arm=soc guys
> merge the at91 tree into theirs).
> 
> In fact, I am going to have problems today as Russell has already 
> rebase his for-next branch.  :-(
> 
> I assume that the merge was done to fix some conflicts or pick up 
> some functionality that is in Russell's tree.  This should be done 
> by merging topic branch(es) of that tree that Russell has 
> explicitly said are stable.

Yes, I was anticipating a stable branch from Russell and never should
have pushed into a branch that would have gone to linux-next: My
mistake, sorry.

Note that my intention was not to use this branch or one based on
rmk/for-next in any "pull request". It was just a hint for people that
wanted to work on at91 for 3.4...

So, Stephen, can I ask you to remove the at91-next branch from your
pull list. For the moment we can rely on arm-soc guys to experiment
our changes in linux-next. It may be simpler for everyone.

thanks for your understanding, best regards,
- -- 
Nicolas Ferre
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJPInTFAAoJEAf03oE53VmQ01UIALIkAxoj3Oxou45+Ts0hjqCk
ddQpqXsoZt44B/b+M+b2wPKK+stmjAVXT8KQJporgckmJyatc/H3BOdaCw5a4rGR
PPrBjEZRx+cH6IXnzII2b73MkdvmKrICOlKpcuIlJiXPcpWet0J1K4lmMWxDPC2D
zGeTFMqqUYMOxxADtRZhsHo/ryZivtaZf9LfYS5pYc7u4vhqjkCt8q07NabgIRaL
GpfyXSLFl30Sqx53Di6DLr0OUUmHGPvjDj1xR3yqdeXtO9vpoiwZequlVX+PYboL
S6OUPYjrDy8uRTNNkz1X8erruOx/y0T87/l4SHt28Aoz9p9sobcykcyRqQyHGJw=
=YhKe
-----END PGP SIGNATURE-----
