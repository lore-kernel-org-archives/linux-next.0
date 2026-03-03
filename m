Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4733F33DEC8;
	Tue,  3 Mar 2026 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544533; cv=none; b=Gf1bDu1O5shoaaR0G7ROD6P3ht6bP/CVWGauqLwlP9I0URXuTVGKVEaiqyfeGDohr0U040GjmRPnRpZIM6XdOoQGYN3bpCOjIYGe+L9awWbFEQeqPQxBXKmblZadhxRx2vSQXL6Rm3bEcrnBy+nCfUG/5CGFLjG7waRsjbjRLlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544533; c=relaxed/simple;
	bh=OoxRxW1+W6MehWhZditBoet89XEfomxqe8zqK3/No6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ouUhsxIdeSKEzK100lcPS7rNcjXoj8OUONFYE2kTyS1siGJJJV2ou21EZjSMxbRV9jtg5byM3Bk+cBFRvnhAB892NOWilrwoszwBpZvw/eZLWV3QpGHzUcJN/wRhVdh0smK6Z5y3zC/maLytighV59T+zL9LWAI+XEllX8YVVlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJ0VThL7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJ0VThL7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D3AC116C6;
	Tue,  3 Mar 2026 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772544532;
	bh=OoxRxW1+W6MehWhZditBoet89XEfomxqe8zqK3/No6E=;
	h=Date:From:To:Cc:Subject:From;
	b=SJ0VThL7bRe7jyJPHt6tICD0xIuYjjfmpHHVwth1OoNjG8anoG6HmOKrHeXWVAHG9
	 OXagW9C/5bliUVNFqXmQrqeFKgatmf1RmHUW3CX2CCLprQUxrTHWKcfCi+xAxgxXrB
	 69dLK5FlVSvFZ0xM+/9OYjmZ486mB9s+Sv1cxSE+AK3VDs9DKKP2BnBJIhYyFuWqJ7
	 EuCzcgszW/k8SCe2RfH+1N5dPveWMlU/9Ptv9/D7W8Wv6dhbyLXYpn9OiXK1jWwFos
	 okuPbS9zlEzpY8+rXgfPBEQ7+/5YxEREWHkeGsniGO4fcknZ2jo9/hqsm2GLC1S0Lz
	 34j+dtkUy2PrA==
Date: Tue, 3 Mar 2026 13:28:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	zhidao su <suzhidao@xiaomi.com>
Subject: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <aabiEPPiSuelemAG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5XBeEuxy74sF9tes"
Content-Disposition: inline


--5XBeEuxy74sF9tes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sched-ext tree got a conflict in:

  kernel/sched/ext.c

between commit:

  c2a57380df9dd ("sched: Replace use of system_unbound_wq with system_dfl_w=
q")

=66rom the tip tree and commit:

  3f27958b729a2 ("sched_ext: Use READ_ONCE() for plain reads of scx_watchdo=
g_timeout")

=66rom the sched-ext tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc kernel/sched/ext.c
index a448a8407d8e0,b9247c9f0430b..0000000000000
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@@ -2762,8 -2848,8 +2848,8 @@@ static void scx_watchdog_workfn(struct=20
 =20
  		cond_resched();
  	}
 -	queue_delayed_work(system_unbound_wq, to_delayed_work(work),
 +	queue_delayed_work(system_dfl_wq, to_delayed_work(work),
- 			   scx_watchdog_timeout / 2);
+ 			   READ_ONCE(scx_watchdog_timeout) / 2);
  }
 =20
  void scx_tick(struct rq *rq)
@@@ -5059,8 -5175,8 +5175,8 @@@ static int scx_enable(struct sched_ext_
 =20
  	WRITE_ONCE(scx_watchdog_timeout, timeout);
  	WRITE_ONCE(scx_watchdog_timestamp, jiffies);
 -	queue_delayed_work(system_unbound_wq, &scx_watchdog_work,
 +	queue_delayed_work(system_dfl_wq, &scx_watchdog_work,
- 			   scx_watchdog_timeout / 2);
+ 			   READ_ONCE(scx_watchdog_timeout) / 2);
 =20
  	/*
  	 * Once __scx_enabled is set, %current can be switched to SCX anytime.

--5XBeEuxy74sF9tes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmm4g8ACgkQJNaLcl1U
h9DUtAf46lrgXmFu6/aIVoA74tH0zuBpKqL3Ueg4Bok13Jvlhjj0bq1Y98AOruPd
GH5dNVeqeWdNy1HixVg1J/EQJtDlbPZFOFRNk0QkZp8upH04qq1piZck9pPBj2X/
QFB7Kv/D6/ddgsPbVLoESXESTTpxvJUB5q0wb8qnsfBCXa+xMNe7m+GxDYQK/1EI
0k/lJ49G0Zwo1KlCSTYhUUhlOQFLGUHU0Zh+7Sbc4L45LAi8hktzJhiAgV1pMaXq
ZY8RYv4KPh3R2hJ5h8g9QWYXaldEVTBHoB0CQErzQqUisHe4+haCzZwPkWzGBA/J
2PUR0NJSd6PnA29qNnh43hiiyH07
=EHt4
-----END PGP SIGNATURE-----

--5XBeEuxy74sF9tes--
