From: Kees Cook <keescook@chromium.org>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Sun, 12 May 2013 21:49:53 -0700
Message-ID: <CAGXu5j+bxbXrj-Xf38gekusz2jQNWjLVu1i=Wasqhwowhe3QrA@mail.gmail.com>
References: <20130513120728.f3f469e5d71b39ec78800175@canb.auug.org.au>
	<1368411070.929.19.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368411070.929.19.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Paris <eparis@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Layton <jlayton@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On Sun, May 12, 2013 at 7:11 PM, Eric Paris <eparis@redhat.com> wrote:
> On Mon, 2013-05-13 at 12:07 +1000, Stephen Rothwell wrote:
>> Hi Andrew,
>>
>> Today's linux-next merge of the akpm tree got a conflict in
>> kernel/auditsc.c between commit b24a30a73054 ("audit: fix event coverage
>> of AUDIT_ANOM_LINK") from Linus' tree and commit "audit: fix mq_open and
>> mq_unlink to add the MQ root as a hidden parent audit_names record" from
>> the akpm tree.
>
> Actually, I've already picked the patch up for 3.11.  So Andrew, you can
> drop it.
>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>>
>> BTW, commit b24a30a73054 from Linus' tree has Eric Paris as Author and
>> Committer, but is only Signed-off-by Kees Cook.  It is part of a long
>> series that did not go anywhere near linus-next.   I do have an audit
>> tree in linux-next
>> (git://git.kernel.org/pub/scm/linux/kernel/git/viro/audit.git#for-next)
>> but that hasn't seen any recent activity.
>
> I thought I sent you a note asking for audit to get pulled into -next
> quite a while back.  I'll resend...
>

Hrm, how did the Author get mangled?

-Kees

--
Kees Cook
Chrome OS Security
