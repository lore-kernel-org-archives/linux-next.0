From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Tue, 28 Aug 2018 07:23:33 +1000
Message-ID: <20180828072333.36af4d5d@canb.auug.org.au>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
        <20180824204756.e787765461975cd1e27502dc@kernel.org>
        <20180824224211.2934d7c0@canb.auug.org.au>
        <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//omMfqXpt1An4ALDYVQP7Lp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180826171058.e07f99e6e03f7497e5a46ed3@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_//omMfqXpt1An4ALDYVQP7Lp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masami,

On Sun, 26 Aug 2018 17:10:58 +0900 Masami Hiramatsu <mhiramat@kernel.org> w=
rote:
>
> Hmm, unfortunately, I couldn't reproduce the ".data..LPBX1" error with
> my gcc-8.1.0 + ld-2.30 distributed at https://cdn.kernel.org/pub/tools/cr=
osstool/.
> Could you also try to enable CONFIG_GCOV_PROFILE_ALL=3Dy and build the ke=
rnel?
> If it causes similar error, it should be caused by gcov support.

Using the allyesconfig as a base and disabling CONFIG_COMPILE_TESTING
allowed me to enable COMFIG_GCOV_PROFILE_ALL, but that just generated a
lot more messages.  Some about data..Lusan sections (I think).

--=20
Cheers,
Stephen Rothwell

--Sig_//omMfqXpt1An4ALDYVQP7Lp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluEa9UACgkQAVBC80lX
0GzUAAf/dzQZ4V9HiAcBkm6EQIGvlTA2Wf+LfXobKYTxDQUAGLSR0ztWBB4bnhHo
lBxafIkS/8RwYCxOudRIKUiBAiQqNN5R02s9calBax3uowsEmw9BmN3f39qTixsl
ahAuCRsgrfzfUp0LZCDFG3UQb9qEfExqe+nCfknhoNjrN0JkMBEmtpPfW2i3zEVj
X9aIJtoWr8LKzwJ5CFurWZCqPieqdsZosPuOMX6z2PVPSqivkMMr+J1UeEoS1Fxq
jynshQqNWU9AYnJ1AQp8wTCv5+yT5OwEoOkgaVQJxfFldnc4pDWmXeeJQxO6bwmQ
hHnnE+qyyknq/0evyNpsthZ0itrk2w==
=uoOO
-----END PGP SIGNATURE-----

--Sig_//omMfqXpt1An4ALDYVQP7Lp--
