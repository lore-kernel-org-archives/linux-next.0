From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Wed, 15 Oct 2008 12:52:58 +0100
Message-ID: <17034.1224071578@redhat.com>
References: <20081015210514.d3b82dc8.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:38317 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752479AbYJOLxL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 07:53:11 -0400
In-Reply-To: <20081015210514.d3b82dc8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> - 	fid->uid = current->fsuid;
> ++	fid->uid = current_fsuid();

ACK.
