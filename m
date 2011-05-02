From: Valdis.Kletnieks@vt.edu
Subject: Re: linux-next: build warning after merge of the kbuild tree
Date: Mon, 02 May 2011 11:17:15 -0400
Message-ID: <10763.1304349435@localhost>
References: <20110502121817.645d544e.sfr@canb.auug.org.au> <20110502022417.GA11804@redhat.com> <20110502134524.40da4245.sfr@canb.auug.org.au> <20110502142454.a7091ad5.sfr@canb.auug.org.au> <20110502145338.7be2fdbc.sfr@canb.auug.org.au>
            <20110502111337.GA15769@sepie.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1304349435_5428P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lennier.cc.vt.edu ([198.82.162.213]:46562 "EHLO
	lennier.cc.vt.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932098Ab1EBPRg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 May 2011 11:17:36 -0400
In-Reply-To: Your message of "Mon, 02 May 2011 13:13:37 +0200."
             <20110502111337.GA15769@sepie.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

--==_Exmh_1304349435_5428P
Content-Type: text/plain; charset=us-ascii

On Mon, 02 May 2011 13:13:37 +0200, Michal Marek said:

> +# We test for support of the -Wunused-but-set-variable option, because
> +# some version of gcc will happily accept any -Wno-* switch and complain
> +# later during build.
> +ifeq ($(call cc-option-yn, -Wunused-but-set-variable), y)
> +KBUILD_CFLAGS += -Wno-unused-but-set-variable
> +endif

Do we need to do this more generically for all the other -Wno-foo
options under the various W={123} options?

--==_Exmh_1304349435_5428P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFNvsr7cC3lWbTT17ARAqtSAJ4zFhvO0wNswHN1loAzlpf087c8DwCeOub/
k57Xfh3FXL2eBXiClbJSGk8=
=Fupw
-----END PGP SIGNATURE-----

--==_Exmh_1304349435_5428P--
