From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/3] x86: suppress sparse returning void warnings
Date: Fri, 18 Jul 2008 13:42:36 +0200
Message-ID: <20080718114236.GE6875@elte.hu>
References: <1216329754.6029.29.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:43513 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751465AbYGRLmr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 07:42:47 -0400
Content-Disposition: inline
In-Reply-To: <1216329754.6029.29.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org


* Harvey Harrison <harvey.harrison@gmail.com> wrote:

> include/asm/paravirt.h:1404:2: warning: returning void-valued expression
> include/asm/paravirt.h:1414:2: warning: returning void-valued expression

applied to tip/x86/paravirt-spinlocks - thanks Harvey.

	Ingo
