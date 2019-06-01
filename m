From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] firmware_loader: fix build without sysctl
Date: Sat, 1 Jun 2019 12:14:57 +1000
Message-ID: <20190601121457.196aaa07@canb.auug.org.au>
References: <20190531012649.31797-1-mcroce@redhat.com>
        <dbc00eaa-c6e9-45b2-7232-5af35fdea113@infradead.org>
        <CAGnkfhwJm0N2WvLv9o+DZeL9JjDsDp3-TB-G6iS_6mhTyzYRHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.4DKpmM8J4KDFiKa316Skyr"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGnkfhwJm0N2WvLv9o+DZeL9JjDsDp3-TB-G6iS_6mhTyzYRHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matteo Croce <mcroce@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.4DKpmM8J4KDFiKa316Skyr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matteo,

On Fri, 31 May 2019 11:12:39 +0200 Matteo Croce <mcroce@redhat.com> wrote:
>
> please correct the Fixes tag if possible.
> It seems that the hash of the offending commit now is d91bff3011cf

Unfortunately, these hashes will keep changing for things in Andrew's
patch queue until they are sent to Linus.  In the end Andrew will
probably just squash this fix into the original patch.


Cheers,
Stephen Rothwell

--Sig_/.4DKpmM8J4KDFiKa316Skyr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzx36EACgkQAVBC80lX
0GxQHAf+NjKhRDs6MVWS6qYiWpaMsZaUVmhuPik2JMZIZRuhnSuONoLF4p0GF3Sv
+0JBWPCRJgxPSUsaLzsATFJqpNwNh7lWSmsYOkF88PuXde6rzMKPBg5qlkgNsezo
NTCq6XLuXMtCpVKe5cTVpazSkm1zCA6Zoha4TsNDUKdHB9AE9q8lQdXTYF8WgYvs
AczdaTQDbC5lOnY4cZwdVc/h0d2XcfaIDpPMrlKLYxmaEv94+G0mMAgvemIJb/ML
tg/hUlf1yK31UCnroKJrsLjGRbQFuJwJiy0yHweQTzdm1ilMds6w1Q77GTAWw241
0tmkA/0dKGTm+HXsklp3cMjKUUhImA==
=4zvd
-----END PGP SIGNATURE-----

--Sig_/.4DKpmM8J4KDFiKa316Skyr--
