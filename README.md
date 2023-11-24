# UNSW--HOME-VIP-CVME
This is a student project on the computer vision function of the robot.

Imagine a world where technology becomes so advanced that it has a conscience! Well, this isn’t too far from the truth. Our team has been working on a project where we leverage the fields of Computer Vision and Machine Ethics to program a robot which can form its own moral decisions based on interactions with the environment, with a focus on designing ethical AI which we hope can be applied to infinitely many real world scenarios.

This project aims to program a robot (Jetbot) which would run based on the following steps.
1. Robot receives a set of instructions from an external user.
2. The robot computes these instructions and parses them into a PDDL planner.
3. A list of ethical costs are computed based on the rankings of possible actions.
4. Robot selects the course of actions which minimises the ethical costs involved (or the most moral set of actions that can be taken).
5. Given the chosen set of instructions, the robot executes navigation toward completing the given objective, employing computer vision techniques for obstacle avoidance and object detection.

## About This Repo
This Repo consists of files that incorporte the PDDL Ethical Extension, which provides an automated way of PDDL planning with ethical considerations.
