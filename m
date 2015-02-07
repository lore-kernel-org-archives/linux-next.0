From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] x86/tbl/trace: Do not trace on CPU that is offline
Date: Sat, 7 Feb 2015 10:20:02 -0500
Message-ID: <20150207102002.4edc054c@grimm.local.home>
References: <20150206200653.009919583@goodmis.org>
	<20150206200800.689573476@goodmis.org>
	<20150206232754.GA17751@linux.vnet.ibm.com>
	<20150206230206.0733828d@grimm.local.home>
	<CA+icZUX6diUTU0N3=PF1XkiwJokUKxWdAczbGjK4epv+FxpVcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+icZUX6diUTU0N3=PF1XkiwJokUKxWdAczbGjK4epv+FxpVcg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Sat, 7 Feb 2015 09:01:34 +0100
Sedat Dilek <sedat.dilek@gmail.com> wrote:


> - Tested-by's
> - Reference of 2/2 to 1/2

The two are together in the series and fix two different bugs. They do
not need to reference each other.

> - CC: stable v3.17+/v3.18+ ? (1/2 has a hint for backporting in case
> of 3.17+ which is BTW EOL, not sure if there are main distros
> supporting linux-3.17.y)

The first patch fixes a bug introduced in 3.18. There would be no splat
in 3.17 because the check didn't exist then. But the RCU reference
while cpu offline (second bug) was introduced in 3.17 and that is what
the second patch fixes.

> 
> BTW, do you happen to know if there is a someting like a
> "Requires-tag" or "Precondition-tag" (for example the Fixes-tag is
> very helpful)?

We don't need more tags.

> AFAICS people place such information into the commit-message.
> I have seen "References:" but this is more to point to a
> bug-tracking-system (BTS).
> 
> EXAMPLE:
> 
> commit 63b03e2d2477586440741677ecac45bcf28d7b1
> "mutex: Always clear owner field upon mutex_unlock()"
> 
> References: https://bugs.freedesktop.org/show_bug.cgi?id=87955
> 

I may add that, but more appropriate would be to add the commit that
fixes the bug to the bug report.

> Maybe ask godfather of SubmittingPatches greg-kh?
> 

Heh, I haven't read that document in years.

-- Steve
