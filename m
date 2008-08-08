From: James Morris <jmorris@namei.org>
Subject: Re: next-20080808 fs/nfsctl.c build error
Date: Sat, 9 Aug 2008 09:33:34 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808090933210.30183@tundra.namei.org>
References: <alpine.LRH.1.10.0808090825060.29741@tundra.namei.org> <20080808171624.24ae1e10.sfr@canb.auug.org.au> <20080808172527.GB4742@blackpad> <30847.1218236306@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:58240 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755704AbYHHXeE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 19:34:04 -0400
In-Reply-To: <30847.1218236306@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 8 Aug 2008, David Howells wrote:

> James Morris <jmorris@namei.org> wrote:
> 
> > In any case, it seems that linux/cred.h should include linux/sched.h to 
> > provide a full definition of 'struct task_struct', so that 'current' can 
> > be dereferenced (e.g. in current_cred()).
> 
> Not good.  That makes sched.h and cred.h recursively dependent.  sched.h
> really needs splitting up, and the include dependencies need sorting.
> 
> However, for the moment I recommend the attached patch.

Applied.


-- 
James Morris
<jmorris@namei.org>
