From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: linux-next: manual merge of the hdlc tree
Date: Fri, 17 Oct 2008 16:30:38 +0200
Message-ID: <m3tzbbway9.fsf@maximus.localdomain>
References: <20081017165046.b5a05953.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from khc.piap.pl ([195.187.100.11]:58322 "EHLO khc.piap.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752358AbYJQOak (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 10:30:40 -0400
In-Reply-To: <20081017165046.b5a05953.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Fri\, 17 Oct 2008 16\:50\:46 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

Hi Stephen,

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Today's linux-next merge of the hdlc tree got a conflict in
> Documentation/DocBook/Makefile between commit
> 7e3975617df8dd8b7fd94f14200abdec9f71729e ("Remove videobook.tmpl") from
> Linus' tree and commit 9c7205161b03a43861765a26fc72f5a00fdadf75 ("WAN:
> syncppp.c is no longer used by any kernel code. Remove it") from the hdlc
> tree.
>
> Overlapping changes.  I fixed it up (see below).

Thanks. I will update to have the latest Linus' tree.
-- 
Krzysztof Halasa
