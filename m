From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: manual merge of the lblnet tree with the security-testing tree
Date: Fri, 27 Mar 2009 12:32:53 -0400
Message-ID: <200903271232.53524.paul.moore@hp.com>
References: <20090327161957.2bb234d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g4t0015.houston.hp.com ([15.201.24.18]:22734 "EHLO
	g4t0015.houston.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754140AbZC0Qc6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Mar 2009 12:32:58 -0400
In-Reply-To: <20090327161957.2bb234d4.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Etienne Basset <etienne.basset@numericable.fr>

On Friday 27 March 2009 01:19:57 am Stephen Rothwell wrote:
> Hi Paul, James,
>
> Today's linux-next merge of the lblnet tree got a conflict in
> security/smack/smack_lsm.c between commit
> 7198e2eeb44b3fe7cc97f997824002da47a9c644 ("smack: convert smack to
> standard linux lists") from the security-testing tree and commits
> c5b5a2a5e23a0056c76b2084ae2001e55816778a ("netlabel: Cleanup the
> Smack/NetLabel code to fix incoming TCP connections") and
> 174531a7a4f47f47dd706985d3d5e489fec87ab2 ("smack: Add a new '-CIPSO'
> option to the network address label configuration") from the lblnet tree.
>
> I fixed it up (see below - I am not entirely sure it is correct) and can
> carry the fix as necessary.

Thanks, I'll take care of it today.  The problem is most likely due to the 
"netlabel: Cleanup ..." patch as it needs to relocate the smack_host_label() 
function higher in the source file as it is need earlier.

Also, just as a heads-up, I'm going to be posting the labeled networking 
patches for 2.6.30 later this afternoon which should help in the future (they 
are typically pulled in via James' security-testing tree).

-- 
paul moore
linux @ hp
