From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the security-testing tree with
	Linus' tree
Date: Fri, 22 May 2009 06:35:42 +0100
Message-ID: <20090522053542.GY8633@ZenIV.linux.org.uk>
References: <20090522152901.2d220889.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:43384 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750851AbZEVFft (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2009 01:35:49 -0400
Content-Disposition: inline
In-Reply-To: <20090522152901.2d220889.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>

On Fri, May 22, 2009 at 03:29:01PM +1000, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next merge of the security-testing tree got a conflict in
> fs/exec.c between commits a44ddbb6d8a8ffe4e34e417048dfdd8f3dd1de4f ("Make
> open_exec() and sys_uselib() use may_open(), instead of duplicating its
> parts") and 6e8341a11eb21826b7192d0bb88cb5b44900a9af ("Switch open_exec()
> and sys_uselib() to do_open_filp()") from Linus' tree and commit
> b9fc745db833bbf74b4988493b8cd902a84c9415 ("integrity: path_check update")
> from the security-testing tree.
> 
> I used the version of these conflicts from Linus' tree as I assume that
> the changes to may_open() from the latter patch are sufficient.  Please
> check and let me know (or merge Linus' tree and do the resolution for
> yourself :-)).

Just drop their changes to sys_uselib() and open_exec() and keep the
rest of their patch.
