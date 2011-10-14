From: "Sakkinen, Jarkko" <jarkko.sakkinen@intel.com>
Subject: Re: linux-next: build failure after merge of the final tree (security
 tree related)
Date: Fri, 14 Oct 2011 10:25:54 +0300
Message-ID: <CADjiTvAqBsper6atBMMKqubgVbLwYvVqnYFer_BP5=GMG2mtEQ@mail.gmail.com>
References: <20111014180730.193ed2e210b913c5852e9e39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111014180730.193ed2e210b913c5852e9e39@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 14, 2011 at 10:07 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi James,
>
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> security/smack/smack_lsm.c: In function 'smack_bprm_set_creds':
> security/smack/smack_lsm.c:473:21: error: 'PER_CLEAR_ON_SETID' undeclared (first use in this function)
>
> Caused by commit 84088ba23929 ("Smack: domain transition protections
> (v3)"). PER_CLEAR_ON_SETID is defined in linux/personality.h which is not
> directly included by the above file.
>
> I have reverted that commit for today.

Oops. Sorry about that. Thanks for informing, I'll fix the issue ASAP.

/Jarkko
