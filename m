From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the cisco tree with the vfs tree
Date: Tue, 15 Jan 2019 11:18:45 +1100
Message-ID: <20190115111845.0898c0c6@canb.auug.org.au>
References: <20181002162923.13f3f8b1@canb.auug.org.au>
        <20190115093330.1cbb0625@canb.auug.org.au>
        <20190114225412.GD18707@fifo99.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6P_jAQSp9S71.+zepLBGaec"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114225412.GD18707@fifo99.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Walker <dwalker@fifo99.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6P_jAQSp9S71.+zepLBGaec
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, 14 Jan 2019 14:54:12 -0800 Daniel Walker <dwalker@fifo99.com> wrote:
>
> I did a rebase after your original made this. I'm not sure it's needed any
> longer. However, I was planning to rebase my tree again on top of the lat=
est
> Linus tree. How would you like to proceed ?

I still get the conflict when I merge your tree, but it is not such a
bit conflict that it warrants rebasing your tree to get rid of it.  It
will be sorted out easily enough when Linus merges your tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6P_jAQSp9S71.+zepLBGaec
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw9JuUACgkQAVBC80lX
0Gxn9AgAm86qcJzT/hgwFBX2On6mCIkL+DqwgDVi0U9K3Pq5nrYAM38B4kKfd4y4
QEQ0diw7JA4gqfUkZkCf9d6/4Yw/tF2IvQVUmZUZX86FKfe9tYt9qwGUTxM1bgQC
b0RPGfVxzlKl2xGsW73iQTzz4ngGTXOW6z2243wbFCZ00DgKUANf113flcEP8h4C
4tYGixkmetnMJCETW5U1YkRstWZzisZnmhOJPNiS3DLjMQYIMDL+jd3gb+6zlxzc
dzGeRZhwcIw0pNf2qSjgsecDzMoegY6rftV5iwV13cFywT9AtduSPQvQFqIg+597
TYu/KiVa4HQnW+JSFJAahOO2Ihdeag==
=QFjX
-----END PGP SIGNATURE-----

--Sig_/6P_jAQSp9S71.+zepLBGaec--
