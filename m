From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the
 wireless-drivers-next tree
Date: Fri, 30 Nov 2018 16:50:06 +1100
Message-ID: <20181130165006.60b2545f@canb.auug.org.au>
References: <20181130120555.1d35eb6b@canb.auug.org.au>
        <87lg5b5glw.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/a2CF3TbSIR18W7Y1n.ytmZo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87lg5b5glw.fsf@kamboji.qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Wireless <linux-wireless@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sara Sharon <sara.sharon@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/a2CF3TbSIR18W7Y1n.ytmZo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kalle,

On Fri, 30 Nov 2018 06:33:47 +0200 Kalle Valo <kvalo@codeaurora.org> wrote:
>
> I take it that -Wimplict-fallthrough is not enabled by default yet? So
> Dave and Linus won't see these warnings?

Correct.

> What I'm planning is to send a pull request to Dave today and fix these
> warnings in the next pull request. Does that sound good?

That sounds fine.

--=20
Cheers,
Stephen Rothwell

--Sig_/a2CF3TbSIR18W7Y1n.ytmZo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwAz44ACgkQAVBC80lX
0GxIrwf/ZJtOZXL8kuiqTAcbsE005hRgfxjx74aCXNPTTa6ksvWFQowSRbySeLk0
aMLbO4eHn2KKeLwmimkZcRuE1/AzcLXsXLZktCeuqw+EDl9VN5S1OdS1Px5s3uba
EP/vMo70ltzWVMC5y5EI4wnhIVd3MMA9Corw6g0aLsX6ID+yULrKuyp5VPbqMLo8
sUXgHHKCkAtES976YJ7xuJuAe9plaR84fahVkDWjfeZ6PVYM/3njUxs8ty+YiZ+8
0tEaNU9QRHNGNVlyl3PBXyWLHz6PBBeyK5onC7CkoB6b2sE/9gg0S1dS9GZfbEGH
JwwABrV+rqOFmaUhwHA7FS/r/d2OuQ==
=82gj
-----END PGP SIGNATURE-----

--Sig_/a2CF3TbSIR18W7Y1n.ytmZo--
