Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4463281370;
	Mon,  2 Feb 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049195; cv=none; b=iqgOQkVZy3l9dsdGYITVNCIpA+JCtcL7UXB57ihFl1YSF2+7lNSrzFBqnFRA3zpk5FMLtf8ObnXUBzxNWKES47sRISgQprJcucH0NElZopxedo3PgIFFUZzy24x879IfCxKP/w+kap73VlID642/RlCuLkscnRNgkvJogTrSx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049195; c=relaxed/simple;
	bh=eodPRN740JnPNr0ZznGy+x7jqtr/b+yc/Mi96XcYT3M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PvT3PMp7+SDyo78SmW7eqZp+KRW+rrSCSI4aSsjMK+sNHPNYwF/DIivGNtFfw+KX1ui1BOYis9YSEMq8O8STpcSAed2Skv4MNywYvTVwzHKTdjxRodd/Z9ZfxZ6d9DbL32bGwPQVJeZZXboEN3KRyT7I8D+sLqHSDvGOCcz37V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 445121401B3;
	Mon,  2 Feb 2026 16:19:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 772FB17;
	Mon,  2 Feb 2026 16:19:45 +0000 (UTC)
Date: Mon, 2 Feb 2026 11:20:10 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the bpf-next
 tree
Message-ID: <20260202112010.0e46018a@gandalf.local.home>
In-Reply-To: <aYC09rYDOvkNNOaA@sirena.org.uk>
References: <aYC09rYDOvkNNOaA@sirena.org.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: iuouyswhk4epd4hths1i976m1gxtsq77
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 772FB17
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19/GeJ4IubHhXR4YFZ7AzK6XBzl2g1eu40=
X-HE-Tag: 1770049185-169508
X-HE-Meta: U2FsdGVkX18JLky3r+BKF54i+kF933HzC2JrhgK1HSDxaCUGKAeqBHO/9oOfmOhg0yNC+Hrh4BNQ+hw1CJ1kE5Fvn8v+TE51sjz1XSbqHH9uYVwjN5pmofR90SsEtxgliYhlqvGni/Ar4C2ml4VuloPwpfMYTpamCZhy1wbC3i8VL/Tuq83Y+rpDSarGgDrZVFgbn5Yg4EUK2TnpBrLTk8VlUU3KV4lt0mukFqy5uIIecioMT9yZ5ZXoFyXsR+0DLclrmF4+CxTxjyRFW9qA2H+svlBPuxvBdP64pQcNlkIPUMpdp3uUPRbL6q4FU7YM76FcmPGhXKhot9TH9cxcXBJTDQS9kxZz

On Mon, 2 Feb 2026 14:30:14 +0000
Mark Brown <broonie@kernel.org> wrote:

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Mark, the fix looks good to me. The conflict was caused by ftrace
doing a small change that was recommended by Alexei so I hope this isn't a
complex conflict ;-)

-- Steve
