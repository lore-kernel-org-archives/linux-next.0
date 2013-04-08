From: Doug Anderson <dianders@chromium.org>
Subject: Re: hangs on boot in 9984d7394618df9
Date: Mon, 8 Apr 2013 16:46:27 -0700
Message-ID: <CAD=FV=VrOh+3ucJ_4DfzpbMsOOWLK7rPue1e23=oV9tH-wUVPQ@mail.gmail.com>
References: <20130405173623.GE4068@ZenIV.linux.org.uk>
	<515F3A71.9080008@sgi.com>
	<20130405210042.GH4068@ZenIV.linux.org.uk>
	<5162E36F.5020305@sgi.com>
	<20130408155847.GS4068@ZenIV.linux.org.uk>
	<51632DF8.2080402@sgi.com>
	<20130408212327.GU4068@ZenIV.linux.org.uk>
	<20130408214834.GV4068@ZenIV.linux.org.uk>
	<516341ED.5060803@wwwdotorg.org>
	<CAD=FV=WodJER2g45u5pEw0edf+K4uYJjyt0w4ZfX9q=o1a7pYw@mail.gmail.com>
	<20130408230658.GY4068@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130408230658.GY4068@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Nathan Zimmer <nzimmer@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Al,

On Mon, Apr 8, 2013 at 4:06 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> Folks, see if vfs.git#experimental works for you; the PITA had apparently
> been caused by change of open() semantics for /proc/<pid>/fd/<some_pipe> -
> it started to behave like a FIFO, i.e. wait for peer to show up.  Normally
> that's not a problem, but if you have closed e.g. the write end of a pipe
> and try to open /proc/<pid>/fd/<read_end_of_pipe>, you'll get open() waiting
> for writers to appear.  Which isn't what we used to do here (open succeeded
> immediately) and apparently that was enough to trip drakut.
>
> Branch head should be at 574179469f7370aadb9cbac1ceca7c3723c17bee.

That branch booted fine for me and didn't show any problems.

I wasn't easily able to merge onto linux-next and test there though.
I tried applying these the 4 top commits of your branch to
"next-20130408" and it didn't solve my problems.  A full merge of your
branch to linux-next showed conflicts and I didn't dig.

-Doug
