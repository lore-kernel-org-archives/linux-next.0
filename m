From: "Eric Van Hensbergen" <ericvh@gmail.com>
Subject: Re: linux-next: build failure
Date: Thu, 16 Oct 2008 09:00:21 -0500
Message-ID: <a4e6962a0810160700k203bfbe0j903eda150ec30076@mail.gmail.com>
References: <20081016202856.3dcaeac7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.169]:46929 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753635AbYJPOAX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Oct 2008 10:00:23 -0400
Received: by wf-out-1314.google.com with SMTP id 27so8753wfd.4
        for <linux-next@vger.kernel.org>; Thu, 16 Oct 2008 07:00:21 -0700 (PDT)
In-Reply-To: <20081016202856.3dcaeac7.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, Oct 16, 2008 at 4:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Eric,
>
> Today's linux-next build (powerpc allyesconfig) failed like this:
>
> net/9p/client.c: At top level:
> net/9p/client.c:698: error: __ksymtab_p9_client_version causes a section type conflict
>
> Caused by commit f0cad54013b07371dcefd8fa36ff1d3918b49695 ("9p: rework
> client code to use new protocol support functions") from the v9fs tree
> which exported a static function.  I have applied the following patch.
>

Applied and pushed to my for-next tree - thanks very much.
Any reason why this showed up in powerpc and not an x86 build? (in
other words, what could I have done to catch this sooner)

                   -eric
