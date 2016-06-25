From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: manual merge of the audit tree with the security tree
Date: Sat, 25 Jun 2016 09:28:42 +0200
Message-ID: <20160625072842.GA3303@osiris>
References: <20160623141814.5512ffd1@canb.auug.org.au>
 <20160623060113.GA3866@osiris>
 <CAHC9VhRFyy8-z6y+sA2VSgrfJH0ZeuEt+-f-sJJaLpPTsxxzSg@mail.gmail.com>
 <20160624054131.GA3940@osiris>
 <CAHC9VhS+zV4eoeNm8BEyr+ANOrZhtdEab2G0A=OxK4MhG_gg4Q@mail.gmail.com>
 <20160624152046.GB3940@osiris>
 <CAHC9VhSKEEyfP7Gc_bsWbwn-TmjBFi3ATLCcx8VjYDSuBTVj5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58246 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751133AbcFYH2t (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 25 Jun 2016 03:28:49 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u5P7ShSR127952
	for <linux-next@vger.kernel.org>; Sat, 25 Jun 2016 03:28:48 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
	by mx0a-001b2d01.pphosted.com with ESMTP id 23ryh8f9da-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Sat, 25 Jun 2016 03:28:48 -0400
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Sat, 25 Jun 2016 08:28:47 +0100
Content-Disposition: inline
In-Reply-To: <CAHC9VhSKEEyfP7Gc_bsWbwn-TmjBFi3ATLCcx8VjYDSuBTVj5g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Fri, Jun 24, 2016 at 12:20:52PM -0400, Paul Moore wrote:
> > I'm a bit concerned about user space pointers passed as argument for compat
> > tasks. These need to mask out 33 instead of 32 bits.  This is of course
> > system call specific and I don't know enough about audit to tell if it
> > could be a problem.
> 
> From a practical point of view I'm not sure how much of an impact that
> will have as it is unlikely anyone will be doing anything useful with
> those pointer values; for example, you aren't going to be inspecting a
> process' memory space using just the audit log.  Also, at the very
> least we aren't removing any information, just adding in an extra bit
> of potential junk.  Anyone who does care about user space pointers in
> the audit log, should have all the information the need to drop the
> high bit.
> 
> Does that sound reasonable?

Yes, it does. If there should be problems because of the one extra bit that
potentially contains garbage we still can look for a way to fix this.

Thanks!
