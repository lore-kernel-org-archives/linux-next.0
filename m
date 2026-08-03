Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CF442FCC9;
	Mon,  3 Aug 2026 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781119; cv=none; b=mpqoJwZa/CGygbWAokdzCXpzCo+4c0bcCkN7ld6zNKjti/Nzz9oeBmONpKX7aTq6oMAUqY+2AOcAYvPGSMph50STN59EOj0mFcjJ0U1c14X8AIkgCnf/HVAhU58FOEvcTtEu7/OxI4KbWevbUG8jf8COLaaZ4BOKcAQIV0Pby3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781119; c=relaxed/simple;
	bh=HFZoqRSm2WCv/HSIWUc7F+scMyKVN7FQHfC1RR8mkrg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=AzIeYFC+56JKoTngpC1herV9l3wekReMirqkx1+zwVrocZH5/714Y2haPYQifKcgtA9+hQHfUAV1BqpKHtBmYOTKnnDHpNq8AGzcrP2TD60AnqgdCNvdfCbCxiZjklXr7X4ZP/8QrplGRiAM+hYHWnJONh7jY892RuUuTvrgS2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Rm+q3L38; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LTcjog2d; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Rm+q3L38";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LTcjog2d"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hDPss6bHyzMlDs;
	Mon, 03 Aug 2026 20:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785780769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0pg5vdKdmfDtSFhDDoMxYAKscw1ee4hFMSsX7J0wZec=;
	b=Rm+q3L383W1g9P2AOgzUSwSzxKXWPKfqCXxqEjEr/y2YYkjEk0S0s1IqOBjZ/4R+MEe8w0
	7zYsU1k9+VtxeohRmKuIhldJ9MhrzntTY5IboEDpK1UX6hQRgv7PkIQxGqK3k5rsnZFDHz
	K/47sSwQzu9uAPNgOnbJIwv0cHJG1/ltY7AULrUb3LqwxikU8vekL57/1W0y/1cf6ju0ya
	Dja0iEuVuK+0npJXRU5KjukuZBYrQ0DqWAvetSqkGsc2Kh7r/a5y+DAj8RvQaGPdczyLfU
	SKQxXkhJ6qoKKz3V9b7gOrn7qmT+4RKRkPWV7U9Acukr/+4u4J7skXp2RUVfMw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=LTcjog2d;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
Message-ID: <27a9ca7bf4d354e97b0865af8222490cf44f27e7.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785780768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0pg5vdKdmfDtSFhDDoMxYAKscw1ee4hFMSsX7J0wZec=;
	b=LTcjog2dRCGv8Y6ISOAzFiEmNkpkIT+r51TILfDvsQB8SAxf/k680PC/I3WrmlsvZNK+nl
	CyesWmw1sNpDrGCB7SAaU5H0oTP6LK7SO2XXoRjxMPqjzGtKy1mHK89nYcTLy5Y5qCCVy1
	nQEpWImDlr8N5a1wd/RTilUghs/qBCNX20j6Lk7m8/Zkpf3ILhT57mNtTbWVGV3TtSa8DY
	n4OsNWW6EhAhDjLM49CYYz1WBFfsf3EpbdhofhfUo5+G9DsvwuXvR5o7C7XU75o/sEDjC3
	po6qjalBsiJh8pqh5HJd4OehK1curlnE9HUC0Aexu6svc6FFowwE95JsM8XIXQ==
Subject: [Build Errors] kho:
 =?UTF-8?Q?'=E2=80=98HPAGE=5FPMD=5FORDER=E2=80=99?= undeclared'
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: linux-next@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav	 <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
 Muchun Song	 <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand	 <david@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Miu	 <jasonmiu@google.com>, Jork Loeser
 <jloeser@linux.microsoft.com>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,  Manuel Ebner <manuelebner@mailbox.org>
Date: Mon, 03 Aug 2026 20:12:40 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ay6khkkde3zkcycuyhmytefcoxfast4h
X-MBO-RS-ID: 427c8c8f1f2cc33b5c1
X-Rspamd-Queue-Id: 4hDPss6bHyzMlDs

Hi,

when building next-20260803 I get build errors, see below.
I assume it's one of the last 3 commits by Pratyush. Let me know
if you need more info.

Thanks
 Manuel


$make KCFLAGS=3D-Werror -j8 > make_output.txt
In file included from ./include/linux/nodemask.h:92,
                 from ./include/linux/numa.h:6,
                 from ./include/linux/cpumask.h:15,
                 from ./arch/x86/include/asm/paravirt.h:19,
                 from ./arch/x86/include/asm/irqflags.h:100,
                 from ./include/linux/irqflags.h:18,
                 from ./arch/x86/include/asm/special_insns.h:10,
                 from ./arch/x86/include/asm/io.h:45,
                 from ./include/linux/io.h:12,
                 from kernel/liveupdate/kho_block.c:23:
./include/linux/kexec_handover.h: In function =E2=80=98kho_scratch_migratet=
ype=E2=80=99:
./include/linux/pageblock-flags.h:66:53: error: =E2=80=98HPAGE_PMD_ORDER=E2=
=80=99 undeclared (first use in this function)
   66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER=
, PAGE_BLOCK_MAX_ORDER)
      |                                                     ^~~~~~~~~~~~~~~
./include/linux/minmax.h:83:27: note: in definition of macro =E2=80=98__cmp=
=E2=80=99
   83 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
      |                           ^
./include/linux/pageblock-flags.h:66:33: note: in expansion of macro =E2=80=
=98MIN_T=E2=80=99
   66 | #define pageblock_order         MIN_T(unsigned int, HPAGE_PMD_ORDER=
, PAGE_BLOCK_MAX_ORDER)
      |                                 ^~~~~

And a couple more notes.
