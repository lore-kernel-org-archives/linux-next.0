From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Tue, 26 Mar 2019 13:15:50 +0000
Message-ID: <20190326131550.GB10898@sirena.org.uk>
References: <20190326133349.3d9427dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190326133349.3d9427dc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Annaliese McDermond <nh6z@nh6z.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: linux-next.vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 26, 2019 at 01:33:49PM +1100, Stephen Rothwell wrote:

> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:

> sound/soc/codecs/tlv320aic32x4-clk.c: In function 'clk_aic32x4_pll_prepare':
> include/linux/kernel.h:979:32: error: dereferencing pointer to incomplete type 'struct clk_hw'
>   BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) && \
>                                 ^~~~~~

Hrm, seems PowerPC is still not using the common clock API - is there
any plan for that?  There are some ASoC PowerPC uses so it's going to be
a bit of an issue as we expand our use of the clock API.

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlyaJgUACgkQJNaLcl1U
h9CSoQf/XgWnshsX6T2bvGmi4+BRNZFJNeDtSwBpcEyteoYOTlJ2JINTuJnvn+UO
k7fG5WW2OUdNw/SiObjhfWFeqgc6d8W4fo8JUZqL1D8KQuFVtP/adA/SWqmrnCtD
UCI0NJ1EVVl+6yxUsi3FV5GtxuPTF70Wqicl4HZyicjLKAhxkzNzELnmwAf5RXPM
H6VtqYN527rbSjq/v5wLPgx9U/sWFjTusTy2EoG67BeU81h7NfkCNxr2tATwwvEQ
xxdOHCQCFiSegC1oq+SUsSdg0EFdzLVzFFRE2YGTpGQDdYUj//rwAS+WIzDiQh/4
JShDt+DMON0Lxd0SVgOtKbLfeL5wDQ==
=/5jB
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
