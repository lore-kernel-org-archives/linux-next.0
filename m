From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: [PATCH -next] user_namespace: Replace gotos with return statements
Date: Wed, 18 Apr 2018 22:43:26 -0500
Message-ID: <87in8nsvxd.fsf@xmission.com>
References: <20180419024641.24213-1-marcos.souza.org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419024641.24213-1-marcos.souza.org@gmail.com> (Marcos Paulo
        de Souza's message of "Wed, 18 Apr 2018 23:46:38 -0300")
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: linux-next@vger.kernel.org, Christian Brauner <christian.brauner@ubuntu.com>, Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@kernel.org>, Serge Hallyn <serge@hallyn.com>, Seth Forshee <seth.forshee@canonical.com>, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Marcos Paulo de Souza <marcos.souza.org@gmail.com> writes:

> Found while inspecting the code that handles the setgroups procfs
> file.

What perchance might be the advantage of introducing multiple exits
into proc_setgroups_write?

I strongly suspect that if you look at the generated code it will
be worse after your patch.


Eric

> Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
> ---
> Tested locally setting up a new userns, and setting setgroups as deny and allow,
> worked as before.
>
>  kernel/user_namespace.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
> index 246d4d4ce5c7..64a01254ac6b 100644
> --- a/kernel/user_namespace.c
> +++ b/kernel/user_namespace.c
> @@ -1142,22 +1142,18 @@ ssize_t proc_setgroups_write(struct file *file, const char __user *buf,
>  	struct user_namespace *ns = seq->private;
>  	char kbuf[8], *pos;
>  	bool setgroups_allowed;
> -	ssize_t ret;
>  
>  	/* Only allow a very narrow range of strings to be written */
> -	ret = -EINVAL;
>  	if ((*ppos != 0) || (count >= sizeof(kbuf)))
> -		goto out;
> +		return -EINVAL;
>  
>  	/* What was written? */
> -	ret = -EFAULT;
>  	if (copy_from_user(kbuf, buf, count))
> -		goto out;
> +		return -EFAULT;
>  	kbuf[count] = '\0';
>  	pos = kbuf;
>  
>  	/* What is being requested? */
> -	ret = -EINVAL;
>  	if (strncmp(pos, "allow", 5) == 0) {
>  		pos += 5;
>  		setgroups_allowed = true;
> @@ -1167,14 +1163,13 @@ ssize_t proc_setgroups_write(struct file *file, const char __user *buf,
>  		setgroups_allowed = false;
>  	}
>  	else
> -		goto out;
> +		return -EINVAL;
>  
>  	/* Verify there is not trailing junk on the line */
>  	pos = skip_spaces(pos);
>  	if (*pos != '\0')
> -		goto out;
> +		return -EINVAL;
>  
> -	ret = -EPERM;
>  	mutex_lock(&userns_state_mutex);
>  	if (setgroups_allowed) {
>  		/* Enabling setgroups after setgroups has been disabled
> @@ -1194,12 +1189,11 @@ ssize_t proc_setgroups_write(struct file *file, const char __user *buf,
>  
>  	/* Report a successful write */
>  	*ppos = count;
> -	ret = count;
> -out:
> -	return ret;
> +	return count;
> +
>  out_unlock:
>  	mutex_unlock(&userns_state_mutex);
> -	goto out;
> +	return -EPERM;
>  }
>  
>  bool userns_may_setgroups(const struct user_namespace *ns)
