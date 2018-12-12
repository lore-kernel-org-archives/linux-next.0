From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20181211 build: 1 failures 32 warnings (next-20181211)
Date: Wed, 12 Dec 2018 12:18:26 +0000
Message-ID: <20181212121826.GC6920@sirena.org.uk>
References: <E1gWnrV-00086U-3m@optimist> <20181211220620.GS6686@sirena.org.uk>
 <20181211221535.GA20165@flashbox>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7242794207307647095=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181211221535.GA20165@flashbox>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Russell King <linux@armlinux.org.uk>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Daniel Scheller <d.scheller@gmx.net>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--===============7242794207307647095==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline


--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 11, 2018 at 03:15:35PM -0700, Nathan Chancellor wrote:
> On Tue, Dec 11, 2018 at 10:06:20PM +0000, Mark Brown wrote:

> > in ddbridge-ci.c and some other media files.  This is because
> > ddbridge.h includes asm/irq.h but that does not directly include headers
> > which define the above types and it appears some header changes have
> > removed an implicit inclusion of those.  Moving the asm includes after
> > the linux ones in ddbridge.h fixes this though this appears to be
> > against the coding style for media.

> I sent a patch for this yesterday, I think moving the asm includes after
> the linux ones is the correct fix according to the rest of the kernel:
> https://lore.kernel.org/linux-media/20181210233514.3069-1-natechancellor@gmail.com/

> Hopefully it can be picked up quickly.

Ah, great - thanks.  I agree this is probably the best fix, I just
wasn't sure if the media people had some other idea given the coding
style there.

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwQ/JEACgkQJNaLcl1U
h9B8UAf/bhQpTYfbdWBlxI3Hh+LREC2YOitdno0yQl0nOD3MKxv0Fkno4DYV/hkl
AWh0T5M4bytJ5O4vg6uj5XtMEpivN4LNCpK2wYeb1Q++qgtpBnogCxVTNxwFcLqv
t2Em9hv7W8v357Yrj0tinrXcrtR6pcphhlpi8Jx/gmqmWWnDh1XSumBDBrkwnyL+
sZGAU2xeSImKevproorKMMLPhXHEILnColHXqEgoI5/Nk/C9zsJh+fRsEguY/ly4
WiwWBKpQWiPkqhn75NqPofC3+47CYQPL2J0/88GeMMyn1N89t1i7lo4QuP/wsCBa
euu4kjI/V4qElksEKNg4conoD2Yw1Q==
=jOVL
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--


--===============7242794207307647095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7242794207307647095==--
