From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the
 kselftest-fixes tree
Date: Thu, 14 May 2015 07:05:22 +0200
Message-ID: <20150514050522.GA29268@gmail.com>
References: <20150514143516.3dd92949@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150514143516.3dd92949@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Shuah Khan <shuahkh@osg.samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in 
> tools/testing/selftests/x86/run_x86_tests.sh between commit 
> c1e6e5cb941b ("selftests, x86: Remove useless run_tests rule") from 
> the kselftest-fixes tree and commit e22438f8e997 ("x86, selftests: 
> Add a test for the "sysret_ss_attrs" bug") from the tip tree.
> 
> I fixed it up (I removed the file) and can carry the fix as 
> necessary (no action is required).

Thanks Stephen - I've dropped this and the other conflicting commit 
from -tip, so both conflicts should go away in tomorrow's integration.

Thanks,

	Ingo
