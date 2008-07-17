From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: [PATCH 3/3] proc: make grab_header static
Date: Thu, 17 Jul 2008 15:15:37 -0700
Message-ID: <1216332937.6029.40.camel@brick>
References: <1216329755.6029.31.camel@brick>
	 <20080717150950.5d721d90.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.171]:36605 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754053AbYGQWQR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 18:16:17 -0400
Received: by wf-out-1314.google.com with SMTP id 27so104072wfd.4
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 15:16:16 -0700 (PDT)
In-Reply-To: <20080717150950.5d721d90.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: viro@ZenIV.linux.org.uk, linux-next@vger.kernel.org

On Thu, 2008-07-17 at 15:09 -0700, Andrew Morton wrote:
> urgh.  We need to do something here.
> 
> People are dumping large hunks of 2.6.28 material into linux-next
> during the merge window.  This screws me up because I haven't merged
> into 2.6.27 yet, and my patch queue is based on linux-next.  And I
> _have_ to do that, because lots of the git trees haven't merged into
> mainline yet.

Good luck.

I'll keep plugging away with my daily allyesconfig of each -next snapshot
to try and keep new warnings from going in....and over time hopefully get
the number to decrease.

Should I CC: you on on those fix patches, or try to get them directly through
the tree they came in from?

Cheers,

Harvey
