From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 18 (mm/memory-failure.c)
Date: Thu, 21 May 2015 10:17:48 +1000
Message-ID: <20150521101748.2ff2fb9e@canb.auug.org.au>
References: <20150518185226.23154d47@canb.auug.org.au>
	<555A0327.9060709@infradead.org>
	<20150519024933.GA1614@hori1.linux.bs1.fc.nec.co.jp>
	<555C1EA5.3080700@huawei.com>
	<20150520130320.1fc1bd7b1c26dae15c5946c5@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gEcqDV543fE+GRdr8+N58q."; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38494 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753241AbbEUAR4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 20:17:56 -0400
In-Reply-To: <20150520130320.1fc1bd7b1c26dae15c5946c5@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Xie XiuQi <xiexiuqi@huawei.com>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, Randy Dunlap <rdunlap@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, Steven Rostedt <rostedt@goodmis.org>, Jim Davis <jim.epost@gmail.com>, Chen Gong <gong.chen@linux.intel.com>

--Sig_/gEcqDV543fE+GRdr8+N58q.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 20 May 2015 13:03:20 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> I dropped
>=20
> memory-failure-export-page_type-and-action-result.patch
> memory-failure-change-type-of-action_results-param-3-to-enum.patch
> tracing-add-trace-event-for-memory-failure.patch

OK, I have dropped them from linux-next as well (on the way fixing up
"mm/memory-failure: split thp earlier in memory error handling" and
"mm/memory-failure: me_huge_page() does nothing for thp").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/gEcqDV543fE+GRdr8+N58q.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXSQxAAoJEMDTa8Ir7ZwVnHwP/0EZ3nLyJXhcDHRCDS7XBPDD
zPra6g1qEUW1xaPqF5sQhXE4WvmQ+yK1pL/6wbLaQ6jnCESv/C4QqbI3INnLycrR
V1f1g0qzMzmHn1iygudDcCqbRE1aj/6g5BjM4qGBbb+JbwrAX3ixloZZTmyWjm+Y
mGt19qU5IcmLU/OgOw1A+4IBFUHGVEjbCzanJ9g7p0KBTk+SWa6qYXmmJzz/cyi2
WfYkcHWSzJI0Ih1TZ3f+chENxiFpX7zhw1fUhkRZFZTlPA4DYFRqAH3o6Tq0bvYg
tqg3nzxtqVD3HzbQWVNuBPv23qFgW0PFr6GKvUsqsKyC2GZxamhA9QIZ/UFIz3q8
h6TxNhrh7wQwRaiPwlZrtO+8LwIQnJfDfVuJlT9QJnWZeWkJjkihTjKxZ/fwqyTH
tSlon+aAnf67AgaVeopQn9C33ZAWTLir1nkYjQGpfVIwr3rRWg1GMCK2tc/aJQsD
UKoGR1fgbHXi4/d6e6/3vqNh86D/zDGQH+CPY4KzOVlpooTbt5TxemF5At+C/3fl
hLK/9WWsQsN6tL2GtZcvtPUl6Q04vgZtea92+a17gwRrWGmHJE4m6EAJfPmOUMbQ
pQqN+q9IiOsO3BRpyIYv9crcNtNcqby8e1S1vutUK+PVa/lLQnROC1b3BKNUwQp5
M6TX4NStR6s1Ie9zfAe7
=1VMK
-----END PGP SIGNATURE-----

--Sig_/gEcqDV543fE+GRdr8+N58q.--
