
[Source](https://blog.skeddly.com/2017/03/ebs-snapshots-explained.html "Permalink to EBS Snapshots Explained | Skeddly")

# EBS Snapshots Explained | Skeddly

## EBS Snapshots Explained

[Amazon Elastic Block Store][1] (or EBS for short) is a service for providing block storage to your EC2 instances. In other words, it provides reliable volumes (hard drives) to your cloud servers.

One very useful function of Amazon EBS is creating [EBS snapshots][2] of your EBS volumes. EBS snapshots are backups of your EBS volumes. But how do they work, and how can you use them? Let's take a look.

### What Is an EBS Snapshot?

An EBS snapshot is a point-in-time backup of your EBS volume. It is a "copy" of the data on your EBS volume.

If you are looking for a disaster-recovery solution for your EBS volume, this is the solution.

If you want to "backup" your EC2 instance, then you want to create EBS snapshots of the EBS volumes attached to the instance.

### Is an EBS Snapshot a Full or Incremental Backup?

Yes.

An EBS snapshot is actually both a full backup and an incremental backup.

When an EBS snapshot is created, only the data on the EBS volume that has changed since the last EBS snapshot is stored in the new EBS snapshot. In this way, it's an incremental backup.

Internally, the EBS snapshots chain together.

When an EBS snapshot is used to restore data, all data from that EBS snapshot can be restored as well as the data from the previous snapshots. In this way, the snapshot is a full backup.

#### Is It Safe to Delete Old EBS Snapshots?

Yes. You can safely delete old EBS snapshots. New EBS snapshots will continue to restore properly.

Source: [Deleting an Amazon EBS Snapshot][3]

When you delete an old EBS snapshot, behind the scenes, AWS will consolidate the snapshot data. It will move valid data forward to the next EBS snapshot and it will discard invalid data.

### What Data Is Included In A Snapshot?

EBS snapshots are block-level backups of your EBS volumes. This means that EBS volumes and EBS snapshots don't care what software/filesystems/partitions/etc. are being used on the volume. AWS will simply look at each device block, determine if there's data on it, and include it in the snapshot if there's data.

When you create an EBS snapshot, any data written to the volume up to the time that the snapshot was _started_, will be included. This means that you can safely write to your EBS volume after the snapshot has started without affecting the EBS snapshot. Even if the snapshot is in a "pending" state, it is still safe to write to the EBS volume.

Source: [Creating an Amazon EBS Snapshot][4]

#### "Flush" Your Filesystem

As your application and databases write data to the local filesystem, they are communicating with your operating system (Linux or Windows). However, for performance reasons, the operating system will decide when to write that data to the actual EBS volume. So it's possible that data has left your application, but has not arrived at the EBS volume yet.

To handle this, you should flush your filesystem before creating a snapshot. This pushes all cached data out to the EBS volume. How this is done depends on your operating system and file system.

#### "Lock" Your Filesystem

You should also "Lock" your filesystem. This prevents applications and databases from writing more data to your volumes. Again, how your filesystem is locked depends on the operating system and file system.

#### AWS Recommends…

To safely handle flushing and locking, AWS recommends either:

* stopping your EC2 instance, and/or
* unmounting and detaching the volume from your EC2 instance

Source: [Creating an Amazon EBS Snapshot][4]

However, in production systems, this isn't always possible. So when in doubt, create the EBS snapshots anyways. A snapshot that _may_ have missing data is better than not having a snapshot at all.

### Where Are EBS Snapshots Stored?

EBS snapshots are stored in Amazon S3. However, you are not going to find your snapshots in any of your S3 buckets.

AWS uses the S3 infrastructure to store your EBS snapshots, but you cannot access them while they reside in S3.

### How Do I Restore Data From an EBS Snapshot?

As mentioned earlier, EBS snapshots are block-level snapshots. This means that it has no knowledge of the file system being used. So it is not possible to access individual files in your EBS snapshot.

To restore data, you must create a fresh EBS volume from your EBS snapshot. That new EBS volume will contain all the data stored in the EBS snapshot. It will be an exact duplicate of the original EBS volume, at the time the EBS snapshot was started.

More information: [Restoring an Amazon EBS Volume from a Snapshot][5]

Once you have your new EBS volume, you can:

1. Attach it to an existing EC2 instance,
2. Sign-in to your EC2 instance (SSH, RDP, etc.),
3. Mount the filesystem,
4. Access your files.

If your EBS snapshot was from a root EBS volume, then you can:

1. Mount the volume as the root volume of a compatible EC2 instance,
2. Start the EC2 instance with the new root volume.

#### Do I Need the EBS Snapshot After Creating an EBS Volume?

When you create the EBS volume, the data is copyed from the EBS snapshot to the volume.

So once your EBS volume is ready, you can safely delete the EBS snapshot.

### What Can't I Do with an EBS Snapshot?

* You cannot access data directly from the snapshot.
* You cannot copy the EBS snapshot to Glacier for cheaper storage.
* You cannot restore an EBS snapshot into or onto an existing EBS volume.

### What Can I Do With an EBS Snapshot?

* You can copy an EBS snapshot to another region.
* You can copy an EBS snapshot within your own AWS account.
* You can share an EBS snapshot with another AWS account.
* You can copy an EBS snapshot from another account that has shared the EBS snapshot with your account.
* And most importantly, you can create a fresh EBS volume from your EBS snapshot.

### Final Thoughts

Plan ahead. Backup early and backup often.

EBS snapshots are invaluable when disaster happens.

#### More Information

A few years ago we wrote up some information on [EBS snapshots][6]. Some content from this article overlaps that article, but there's still some good information there.

### About Skeddly

[Skeddly][7] is the leading scheduling service for your AWS account. Using Skeddly, you can:

[Sign-up for our 30 day free trial][8] or [sign-in to your Skeddly account][9] to get started.

By Matt Houser on Mar 21, 2017 in [Amazon EBS][10] | [Permalink][11]

[Tweet][12]

[1]: https://aws.amazon.com/ebs/
[2]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html
[3]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-snapshot.html
[4]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-snapshot.html
[5]: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-restoring-volume.html
[6]: https://skeddly.desk.com/customer/en/portal/articles/1346922-ebs-snapshots
[7]: https://www.skeddly.com/
[8]: https://app.skeddly.com/Account/Register/
[9]: https://app.skeddly.com/
[10]: https://blog.skeddly.com/amazon-ebs
[11]: https://blog.skeddly.com/2017/03/ebs-snapshots-explained.html
[12]: https://twitter.com/intent/tweet

  