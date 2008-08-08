From: Jeff Layton <jlayton@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 8 Aug 2008 07:41:11 -0400
Message-ID: <20080808074111.6ccfc4fd@tleilax.poochiereds.net>
References: <20080808160143.bd1c7ea3.sfr@canb.auug.org.au>
	<20080808160303.224eb000.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:33428 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756017AbYHHLq0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Aug 2008 07:46:26 -0400
In-Reply-To: <20080808160303.224eb000.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org

On Fri, 8 Aug 2008 16:03:03 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi David,
> 
> On Fri, 8 Aug 2008 16:01:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the creds tree got conflicts in fs/cifs/dir.c
> > between commits 4e1e7fb9e879d48011a887715d7966484d9644ea ("bundle up Unix
> > SET_PATH_INFO args into a struct and change name") and
> > 95089910933e10768cfef1ab0bab0c55b962aacb ("[CIFS] cifs_mkdir and
> > cifs_create should respect the setgid bit on parent dir") from the cifs
> > tree and commit 785af0f385cd424d4b40908bf0e467df3dc05434 ("CRED: Change
> > current->fs[ug]id to current_fs[ug]id()") from the creds tree.
> > 
> > I fixed it up as best I could.  Might be worth a check once I publish the
> > tree.
> 
> The same applies to fs/cifs/inode.c
> 

>From a quick look, your fixes look correct to me...

Thanks,
-- 
Jeff Layton <jlayton@redhat.com>
