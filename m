From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Mon, 25 May 2015 16:11:49 +0200
Message-ID: <55632DA5.4070106@redhat.com>
References: <20150525172507.20799066@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49910 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750908AbbEYOMB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 10:12:01 -0400
In-Reply-To: <20150525172507.20799066@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liang Li <liang.z.li@intel.com>, Yang Zhang <yang.z.zhang@intel.com>, Rik van Riel <riel@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256



On 25/05/2015 09:25, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in 
> arch/x86/kvm/x86.c between commit c447e76b4cab ("kvm/fpu: Enable
> eager restore kvm FPU for MPX") from the  tree and commit
> 653f52c316a4 ("kvm,x86: load guest FPU context more eagerly") from
> the kvm tree.
> 
> I fixed it up (I used the version from the kvm tree) and can carry
> the fix as necessary (no action is required).

A true conflict resolution is needed, but I'll push it to the kvm tree
in the next few days.

Paolo
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVYy2iAAoJEL/70l94x66DibAH/04gli1LtFZbqOMHgxId+8qc
HB1aqK/LBin4wdFmlBFUDT9AH1Q08SZ0sghmnOiQb17WZs9YRGBMKUJq+OPt/lky
EgCSzv9iBAkuOLKC1tPmjDhKBok1SNWipqIUj1UtCKCtVBdWd7yG3C99KQQPT46V
a66Jhk1KG7CryrqBfRpDnKSXbQTWiBFH4r6z2XAKboFiTMIp8EsWErMzHv7km5Zd
Nw8Ia0AyAsVF4C85J00dQDeuQdwyfLyQEb+s7Zf5qFLIYO/Zd5HXezX8y8rDuSu9
UIDtkKcebU1ddrXa/ocja3df52IMOsRLW1lg3shFO0MLWAqRtcx3WnqWC6J8Dx8=
=AHYH
-----END PGP SIGNATURE-----
