From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: triage for March 18, 2012
Date: Mon, 19 Mar 2012 15:03:57 +0000
Message-ID: <1121.1332169437@redhat.com>
References: <20120318235114.GA30497@thor.bakeyournoodle.com> <20120318184105.GC2095@windriver.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:62740 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1031623Ab2CSPEE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Mar 2012 11:04:04 -0400
In-Reply-To: <20120318235114.GA30497@thor.bakeyournoodle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Breeds <tony@bakeyournoodle.com>
Cc: dhowells@redhat.com, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Tony Breeds <tony@bakeyournoodle.com> wrote:

> > 	frv:defconfig  (arch/frv/kernel/head.S operand out of range)

What binutils are you using?  I suspect this is fixed by a patch that only
went upstream very recently.  Are you using a 64-bit machine to do your
compilation?

David
