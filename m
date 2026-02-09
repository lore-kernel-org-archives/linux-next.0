Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF413815E4;
	Mon,  9 Feb 2026 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657256; cv=none; b=nshZpb7IJ6k7zi6HKz4z3DapDCm5OTH80U0RBGDhy27Q1rEWzjfxKdxvbb2t12VGFiX+fFLBdskWPSJ8mgOlKXbiHiDUao6Qc5SU532sgHpDefllprt6wKktEBZvYff+rY3pVJ/08tCgdfUuAA/BSjlrjN8JwYeC/tnxyvEY1wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657256; c=relaxed/simple;
	bh=XNMXuoquF7i8DdaSzfE4guJzAOfOBGJPCVdTWlNIMKM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6Canqh+pkpadlpb+poyODpuFcZRLoApXE4hnbeLMO21ZHk7btjErvTFl3BMEVJJF4VwcOxx1DOX06LS5vQKZh6H4BJKCoJC2tdpXmHx8YcnYvAWSarDas8AQzbtpky+ofchzIqzdFYLThy8jka5VCyaPhAw+IX7g5fUFgSnfJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 96C3F1B2963;
	Mon,  9 Feb 2026 17:14:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 3706119;
	Mon,  9 Feb 2026 17:14:07 +0000 (UTC)
Date: Mon, 9 Feb 2026 12:14:05 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yury Norov <ynorov@nvidia.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 mm-nonmm-stable tree
Message-ID: <20260209121405.3bbc2cb9@gandalf.local.home>
In-Reply-To: <aYoURlMX4UQJsekN@sirena.co.uk>
References: <aYoAtbc4L0N-g6C-@sirena.co.uk>
	<20260209085810.9aa1e0c9e8cac00ba9585171@linux-foundation.org>
	<aYoURlMX4UQJsekN@sirena.co.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: pyikq6jbxeobpeuzddqpa51zwnog8w3a
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 3706119
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/AG+njQzUQOTDZe6XhLPnyM5VbT2uPd1U=
X-HE-Tag: 1770657247-228107
X-HE-Meta: U2FsdGVkX18/o7JjdM7PbtV77KuqPiKBNpjC/O+rb4bvDGoHSR14bmzWti4xet3mcrHtPteWH09/BXPo2uMe/FK8NV8JdtK9HmtZhtHsiWK/8VZ4bNqUpROK7F1FAH/ShXintCCnTPws5p8RaAWwG1QwBedpIoGr/6i/8Jf0oU1NwA69+5dbp5dDK/ngI7BBqzj0s5GYS3ltjY5H3fRXvIQaBHqQuzhw1x435IjNe+8n+IkJoRKlTXp0i+sgRA6pzBpkmJa7eXQN0w8KMJnJzYPIISyt5PNeyAZWGPhASbZ3dRSpCV9MS+Ie4vk3WCq89xtWZChdPsNEE/L5d88UCz47w33P21w1

On Mon, 9 Feb 2026 17:07:18 +0000
Mark Brown <broonie@kernel.org> wrote:

> FWIW that diffstat looked a lot worse than it was since it was one of
> these git shows as an empty diff and I used diff -c instead which
> usually looks more alarming - the change was trivial code motion
> deleting code in the ftrace tree with the actual fixup being very small
> but in a different file.  Was a bit weird that the parameter removal
> didn't go via the ftrace tree though.

If you look at the change log of the commit in the mm tree, you'll see why
it went there:

    This fixes a header recursion issue where using strlen() in the macro
    calling __trace_puts() requires adding #include <linux/string.h> in order
    to use strlen().  Removing the use of strlen() from the header fixes the
    recursion issue.

The mm tree took code to move things around, and by moving the
trace_printk() into its own headers caused the build to fail!

I guess I could have taken the moving of the trace_printk() code in my
tree. But it was part of a series that did other moves so I didn't
recommend it.

-- Steve
