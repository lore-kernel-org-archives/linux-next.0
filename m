From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 31 Oct 2008 09:03:07 +0000
Message-ID: <25079.1225443787@redhat.com>
References: <20081031164708.fd0bfba5.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:52982 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752542AbYJaJED (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 05:04:03 -0400
In-Reply-To: <20081031164708.fd0bfba5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Eric Sandeen <sandeen@redhat.com>, Theodore Ts'o <tytso@mit.edu>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> - 	if (sbi->s_resuid == current->fsuid ||
> ++	if (sbi->s_resuid == current_fsuid() ||

ACK.
