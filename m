From: Davide Libenzi <davidel@xmailserver.org>
Subject: Re: linux-next: manual merge of the kvm tree with Linus' tree
Date: Wed, 1 Jul 2009 08:11:43 -0700 (PDT)
Message-ID: <alpine.DEB.1.10.0907010811020.10303@makko.or.mcafeemobile.com>
References: <20090701145711.1c9c8935.sfr@canb.auug.org.au> <alpine.DEB.1.10.0907010007020.8745@makko.or.mcafeemobile.com> <4A4B1106.8000506@redhat.com> <4A4B56FE.8060407@novell.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from x35.xmailserver.org ([64.71.152.41]:43322 "EHLO
	x35.xmailserver.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752685AbZGAPMS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2009 11:12:18 -0400
Received: from makko.or.mcafeemobile.com
	by x35.xmailserver.org with [XMail 1.26 ESMTP Server]
	id <S2F513E> for <linux-next@vger.kernel.org> from <davidel@xmailserver.org>;
	Wed, 1 Jul 2009 11:11:32 -0400
In-Reply-To: <4A4B56FE.8060407@novell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory Haskins <ghaskins@novell.com>
Cc: Avi Kivity <avi@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Wed, 1 Jul 2009, Gregory Haskins wrote:

> Just to be clear: the final form will need to be wake_up_poll(), not
> wake_up_locked_poll.

Yep, sorry I missed that one.


- Davide
