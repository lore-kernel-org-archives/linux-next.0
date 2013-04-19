From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [Q] Diff of two successive -next releases?
Date: Fri, 19 Apr 2013 12:51:54 +0200
Message-ID: <CA+icZUXMBthFSzvEW887NocNsOG1D6KVJK7mc3sTjBNhxxZ2tA@mail.gmail.com>
References: <CA+icZUXSbzxYjC2JWdso-OPVjjaoFkFX-t9f8CqJdVuPeE7vJw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:65130 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968140Ab3DSKv4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Apr 2013 06:51:56 -0400
In-Reply-To: <CA+icZUXSbzxYjC2JWdso-OPVjjaoFkFX-t9f8CqJdVuPeE7vJw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 19, 2013 at 12:35 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> Hi,
>
> I would like to do a diff between a problematic next-yyyymmdd and
> next-[yyyymmdd+1].
> How can I do this easily?
>
> My old style was to checkout a specific Linux-Next release and then
> create a diff against the latest -rcX (of mainline).
> So, I have two diffs and try to compare them.
>

I was not precise enough... not only a diff also a list of changed
commits (commit subject) to possibly identify a problematic commit
(for later test with a revert).

- Sedat -

> Thanks in advance.
>
> Regards,
> - Sedat -
