Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795214696;
	b=tNTBkjqtM2ThZilWQBPjHqx3o2KXgxpKLDhpAE7eNLw18aJ2xKaQ/Uob8BqVk0B2Lzhc
	 BWPH5MW+/jVHKuwBb+dW4hkvFF2lUvHmYbz9d/MoH1w2/KdGLiZIYT/z8p8S84QWzjiD5
	 kICmXua4cRADN6Ow4TjzMt8GX+KF+6yB1n2COp7EiSmQf/zh/BbOjiuun6LiUkTrc7j9N
	 unN4z/5jxMtEZdXCAu6XShCzN0GWxH95h1mshUazfFCQ6Ns4647CjhaTk+xf6Dzv8hqvx
	 wi9NsQKpwL1cdJ3+Bj71stz8o/R57v2Yy45RBDF4TAiBc/C4WsZwj6STcIF7qLR937g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795214696;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=pyi0fUWsXsExR7kVJ9xbEzLFJypDEKHMs/F9EhZvPRU=;
	b=tVMk2u1jvcZx5tpYIouIK2+e7xWLr/neGnQY+FYMtvS/b/+XX2cW/0pI3ozcQWdRdLxo
	 3y3T90fZaz1hJXgxSn9rR7T04pjAgvD3s9JvFdShUlwdgwCf9bJU0SrLL0JCNOk0svE36
	 YhsjNtB0s5DKYTh8AmhfPIBxE1ywsJn2yEciOr2zvGKfimk5C0fbmoIMgmHleeKxNFvnL
	 8j0QUT/1E3FrJ2RsZK+Pp4//Wd7oRxuDVJQvkWGf6cCaJVOnT/hvEFYE+MiXqTJJnXs2U
	 R1ie1lwk5hEwLrpvKwzDfv1aTNFIRL3ggKG0KPk+cf+FNCGeWZINNrbDFeD7pwnBVVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PSQ//YSX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D2606A683;
	Fri, 20 Nov 2026 22:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSQ//YSX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85CD1F000C4;
	Fri, 20 Nov 2026 22:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795214695;
	bh=pyi0fUWsXsExR7kVJ9xbEzLFJypDEKHMs/F9EhZvPRU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=PSQ//YSXN5SgOK+hdSmN0kjsSmMtzOLwSXZ55kkGjCZUsUnZxOo4Ei4XAvmfTqpnX
	 64niO8bgL/DDl72fDNeXyqlMKyXnrAT6k6vNayPooa3GkQNaGb+ljTHOFAaFPIP0Bs
	 tdY7WuS3K5PxYVWiQRMC3LJYAYb9lZ+A9q4ElRG5SdztgKumr4qSgCkLWc20/Jjv5l
	 oKHIX0yaI6Poy9tbNJ8oiyJzAYwaok54OaQCqXbDfixnDgAAgHFOTpb63PqHe/Vkk3
	 OwHP1PRvLemVmxYpizaV0RRbCLSMQ1dNUu/JVwPj+ps9oPXhkEhCsg+zQcpcYVn/0N
	 qhz6RY3tGP9sg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6FA4BCE09D1; Fri, 20 Nov 2026 14:44:55 -0800 (PST)
Date: Fri, 20 Nov 2026 14:44:55 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Joel Fernandes <jfern@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: Re: linux-next: manual merge of the paulmck tree with the rcu tree
Message-ID: <2813d085-c569-4558-bbe6-10769c2554e5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <avzYzJYQGafi4gGL@sirena.org.uk>
 <79d23a21-b91f-4709-b956-019288f62f10@paulmck-laptop>
 <20261118154941.GB946893@joelbox>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118154941.GB946893@joelbox>

On Wed, Nov 18, 2026 at 10:49:41AM -0500, Joel Fernandes wrote:
> On 11/17, "Paul E. McKenney" <paulmck@kernel.org> wrote:
> > On Tue, Nov 17, 2026 at 10:44:28PM +0000, Mark Brown wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the paulmck tree got a conflict in:
> > > 
> > >   tools/testing/selftests/rcutorture/bin/torture.sh
> > > 
> > > between commit:
> > > 
> > >   7ada0a57267ab ("torture: Use ${:+} to save a few lines in torture.sh's torture_one()")
> > > 
> > > from the rcu tree and commit:
> > > 
> > >   436f3c6b27de8 ("torture.sh: Add hazptr torturing")
> > > 
> > > from the paulmck tree.  AFAICT the change in the hazptr commit is adding
> > > quoting that is also covered by the other commit and should have been
> > > redundant anyway but you really want to double check here.
> > 
> > I confess, I am confused.  If you said that the commit from the rcu
> > tree was instead this one:
> > 
> > ccabfbe01ca5 ("torture: Avoid duplicate identify_qemu_vcpus calls in torture.sh")
> > 
> > I would be less confused.
> 
> Maybe both patches conflicted? The one Mark posted resolved as follows:
> 
> rcu/next tree:
>   	"$@" ${torture_bootargs:+--bootargs "$torture_bootargs"} --datestamp "$ds/results-$curflavor" > $T/$curflavor.out 2>&1
> 
> Paul's tree:
>     "$@" "${boottag}" "$cur_bootargs" --datestamp "$ds/results $curflavor" > $T/$curflavor.out 2>&1
> 
> Mark's resolution:
> 	"$@" ${torture_bootargs:+--bootargs "$torture_bootargs"} --datestamp "$ds/results-$curflavor" > $T/$curflavor.out 2>&1
> 
> Both versions look to be doing the same thing, which is adding the boot
> arguments if the `torture boot args` variable was defined. 

What I have done is to pull the "torture.sh: Add hazptr torturing"
commit out of -next, avoiding this conflict.

I also rebased my stack on top of the rcu tree's "next" branch, which
showed some skew on this commit:

fd5121d99c86 ("rcu: Print CPU that preempted stalled reader wants to run on")

Joel, could you please fold the patch shown below into this commit?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 09e05e2b6c9aa..bd586ea18fdac 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2528,6 +2528,8 @@ extern void migrate_enable(void);
 
 DEFINE_LOCK_GUARD_0(migrate, migrate_disable(), migrate_enable())
 
+struct task_struct *cpu_curr_snapshot_rcu(int cpu);
+
 #endif
 
 struct task_struct *cpu_curr_snapshot_rcu(int cpu);
diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index e0607f4235645..53564b780ec90 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -335,7 +335,7 @@ static int check_slow_task(struct task_struct *t, void *arg)
 	rscrp->rcu_rdr_cpu = cpu = task_cpu(t);
 	rscrp->rcu_rdr_cpu_offline = cpu_is_offline(cpu);
 	lockdep_assert_irqs_disabled();
-	rscrp->rcu_rdr_cpu_task = th = cpu_curr_snapshot_rcu(cpu);
+	rscrp->rcu_rdr_cpu_task = cpu_curr_snapshot_rcu(cpu);
 	// There is no need for get_task_struct(t) because we are in
 	// an implicit RCU read-side critical section due to interrupts
 	// being disabled.
