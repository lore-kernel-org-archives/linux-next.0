From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the rr tree with the hid tree
Date: Tue, 17 Feb 2009 12:30:40 +0100 (CET)
Message-ID: <alpine.LRH.1.10.0902171228490.780@twin.jikos.cz>
References: <20090217161151.0f6e64ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51083 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751296AbZBQLar (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 06:30:47 -0500
In-Reply-To: <20090217161151.0f6e64ef.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, 17 Feb 2009, Stephen Rothwell wrote:

> Today's linux-next merge of the rr tree got a conflict in
> drivers/hid/hid-core.c between commit
> 8390887fae55be9c06e3f064464d2bc8e908b8df ("HID: autosuspend support for
> USB HID") from the hid tree and commit
> c7b902168e6b06e91033bfaf71ca0174ad66c6aa ("use the new
> request_module_nowait() in the hid driver") from the rr tree.
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Yes, please do carry the fix, thanks a lot. It doesn't make a lot of sense 
if I take the patch from Rusty into my tree, as the changes depend on 
other patches in Rusty's tree.

Thanks,

-- 
Jiri Kosina
