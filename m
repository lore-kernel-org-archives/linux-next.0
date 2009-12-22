From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: linux-next: manual merge of the limits tree with the  tree
Date: Tue, 22 Dec 2009 16:07:10 +0100
Message-ID: <4B30E09E.7080200@gmail.com>
References: <20091219094616.744fc1c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.155]:27908 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752899AbZLVPHY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2009 10:07:24 -0500
In-Reply-To: <20091219094616.744fc1c1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Masami Hiramatsu <mhiramat@redhat.com>

On 12/18/2009 11:46 PM, Stephen Rothwell wrote:
> Today's linux-next merge of the limits tree got a conflict in fs/exec.c
> between commit f6151dfea21496d43dbaba32cfcd9c9f404769bc ("mm: introduce
> coredump parameter structure") from the  tree and commit
> 1157605c47673fc63b052df4688697695a9873d5 ("FS: use helpers for rlimits")
> from the limits tree.
> 
> I fixed it up (see below - thanks Andrew) and can carry the fix for a
> while.

Thanks, I fixed that in my tree and pushed now.

-- 
js
