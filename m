From: Valdis.Kletnieks@vt.edu
Subject: Re: The longest build error ever, ever,
	ever seen :) (Re: linux-next: Tree for November 26)
Date: Sat, 27 Nov 2010 13:12:27 -0500
Message-ID: <256560.1290881547@localhost>
References: <AANLkTinY3on+arwh-Rvqnbrx_FU4mKDmpwXR_EfkPJ0f@mail.gmail.com>
	<20101127164555.GA23508@suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1855508308=="
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: Your message of "Sat, 27 Nov 2010 08:45:55 PST."
	<20101127164555.GA23508@suse.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Sender: devel-bounces@linuxdriverproject.org
Errors-To: devel-bounces@linuxdriverproject.org
To: Greg KH <gregkh@suse.de>
Cc: devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Andres More <more.andres@gmail.com>, Radu Voicilas <rvoicilas@gmail.com>, Zimny Lech <napohybelskurwysynom2010@gmail.com>
List-Id: linux-next.vger.kernel.org

--===============1855508308==
Content-Type: multipart/signed; boundary="==_Exmh_1290881547_5841P";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1290881547_5841P
Content-Type: text/plain; charset=us-ascii

On Sat, 27 Nov 2010 08:45:55 PST, Greg KH said:
> On Sat, Nov 27, 2010 at 09:56:45AM +0100, Zimny Lech wrote:
> > Ave!
> > 
> > 2010/11/26 Stephen Rothwell <sfr@canb.auug.org.au>:
> > > Hi all,
> > >
> > 
> > OMG, LOL, this one is awesome :) The longest build error ever, ever,
> > ever seen! Fscking awesome, someone gets Guiness World Record :)
> > 
> >   LD      drivers/staging/built-in.o
> > drivers/staging/rtl8192e/built-in.o: In function `rtl8192_setBBreg':
> > (.text+0xae00): multiple definition of `rtl8192_setBBreg'
> > drivers/staging/rtl8192u/built-in.o:(.text+0xa1a0): first defined here
> 
> You built both of these drivers into the kernel, which causes the
> problem.  Try building them as modules, or just one as a module, and
> that will solve the problem.

We probably should create some Kconfig magic to prevent this situation?

	depends (othermodule != 'y') || (myself != 'y')

or am I on the wrong track here?


--==_Exmh_1290881547_5841P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFM8UoLcC3lWbTT17ARAhg5AJwKE6hh0BXSvwXG7j/H/rpTmkRz0QCg2pF8
oXnCQ43tiM/MyCnbQdyj+Hc=
=KN+I
-----END PGP SIGNATURE-----

--==_Exmh_1290881547_5841P--


--===============1855508308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/devel

--===============1855508308==--
