From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Fri, 7 Sep 2018 08:14:40 +1000
Message-ID: <20180907081440.38623043@canb.auug.org.au>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
        <20180824224211.2934d7c0@canb.auug.org.au>
        <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
        <20180828072333.36af4d5d@canb.auug.org.au>
        <20180828094341.d20d8fbcb9dca310d44df951@kernel.org>
        <f0ca0036-abe1-4252-6d30-b810dd22097d@linux.ibm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mAuTEhGWGuYjKf0qE9EQ4PW"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f0ca0036-abe1-4252-6d30-b810dd22097d@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arnd@arndb.de
List-Id: linux-next.vger.kernel.org

--Sig_/mAuTEhGWGuYjKf0qE9EQ4PW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, 6 Sep 2018 12:49:39 +0200 Peter Oberparleiter <oberpar@linux.ibm.co=
m> wrote:
>
> I've attached a quick fix that should address both problems. I'd
> appreciate if this patch could get some testing before I post proper fix
> patches.

I have added that into linux-next today ... I will let you know this
afternoon how it went (it looks sensible, though).

--=20
Cheers,
Stephen Rothwell

--Sig_/mAuTEhGWGuYjKf0qE9EQ4PW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluRptAACgkQAVBC80lX
0GzP9wgAnpgEZp+lekNmJfyRGjW2uA2qNQUmeu7yDKXTs7MYMI5II1RrVqJ/P6XY
kLj1hX08P1TfeZAjSWSKhPFaRpC+LinnYA+djaLKseLkwY4QgUOJmziUhLBUT6RD
bmUwfv9t1SCgSVLjTWlzyUmWU1W+1VtluOdJXB8JUiQ8vLg6jkd9exOsSCAMNJT3
8xn5mFr64H1AqmEhVpDqCAd4VRdAOW8FAOIBWjkDksz1XNGwYYRdyIYjkD/Oehl7
dV4aUUkN2EcozZMLjILxwuqGaEK1f1JJ42HNqVoBqMEl6fyEuN/btMDtB5jtZ0en
C1oUvCCoa+vrj9SKo6p3+2BGpLDhbA==
=QwFV
-----END PGP SIGNATURE-----

--Sig_/mAuTEhGWGuYjKf0qE9EQ4PW--
