From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build warning after merge of the moduleh tree
Date: Thu, 18 Aug 2011 22:57:44 +0200
Message-ID: <201108182257.44926.rjw@sisk.pl>
References: <20110818150945.b429ef302fd45a6a309b52d4@canb.auug.org.au> <201108181026.51813.rjw@sisk.pl> <20110818192754.972382bbed8fa3adc6dca9c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:50946 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751509Ab1HRU4F (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Aug 2011 16:56:05 -0400
In-Reply-To: <20110818192754.972382bbed8fa3adc6dca9c5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday, August 18, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> On Thu, 18 Aug 2011 10:26:51 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> >
> > Do you mean that drivers/base/power/common.c should include module.h
> > or something else?
> 
> Yes, that is exactly what I mean :-)  See Rule 1 in
> Documentation/SubmitChecklist.  The reason it is different, is because
> the module.h splitup is cerating export.h for files that just need
> EXPORT_SYMBOL (like this file).

OK, I've modified common.c so that module.h is included.

Thanks,
Rafael
